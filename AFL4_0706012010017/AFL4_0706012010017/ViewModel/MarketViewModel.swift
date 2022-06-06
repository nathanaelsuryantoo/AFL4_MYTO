//
//  MarketViewModel.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 04/06/22.
//

import Foundation
import Combine

class MarketViewModel: ObservableObject{
    
    @Published var statistic: [StatisticModel] = []
    @Published var allCoins: [Coins] = []
    @Published var wishListCoins: [Coins] = []
    @Published var profile = Profile.default
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let wishlistDataService = WishlistDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        coinDataService.$allCoins
            .sink{[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        marketDataService.$marketData
            .combineLatest($wishListCoins)
            .map(mapGlobalMarketData)
            .sink{ [weak self] (returnedStats) in
                self?.statistic = returnedStats
            }
            .store(in: &cancellables)
        $allCoins
            .combineLatest(wishlistDataService.$savedEntities)
            .map{(Coins, WishlistEntity) -> [Coins] in
                Coins
                    .compactMap { (coin) -> Coins? in
                        guard let entity = WishlistEntity.first(where: {$0.coinID == coin.id})
                        else{
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self](returnedCoins) in
                self?.wishListCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    func updateWishlist(coin: Coins, amount: Double){
        wishlistDataService.updateWishlist(coin: coin, amount: amount)
    }
    
    private func mapGlobalMarketData(MarketData: MarketData?, wishListCoins: [Coins]) -> [StatisticModel]{
        var stats: [StatisticModel] = []
        
        guard let data = MarketData else{
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24 Hours Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let wishlistValue = wishListCoins.map({$0.currentHoldingsValue})
            .reduce(0, +)
        
        let previousValue =
            wishListCoins.map{(coin) -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = coin.priceChangePercentage24H / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = ((wishlistValue - previousValue) / previousValue) * 100
        
        let portfolio = StatisticModel(title: "Wishlist Value", value: wishlistValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        
        stats.append(contentsOf: [
            portfolio,
            marketCap,
            volume,
            btcDominance
        ])
        return stats
    }
    
}
