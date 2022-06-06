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
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
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
            .map(mapGlobalMarketData)
            .sink{ [weak self] (returnedStats) in
                self?.statistic = returnedStats
            }
            .store(in: &cancellables)
    }
    private func mapGlobalMarketData(MarketData: MarketData?) -> [StatisticModel]{
        var stats: [StatisticModel] = []
        
        guard let data = MarketData else{
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24 Hours Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    
}
