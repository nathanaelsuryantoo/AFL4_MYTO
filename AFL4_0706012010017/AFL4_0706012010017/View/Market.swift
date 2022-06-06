//
//  Market.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct Market: View {
    @EnvironmentObject private var vm: MarketViewModel
    
    @State private var selectedCoin: Coins? = nil
    @State private var showDetailedView: Bool = false
    
    var body: some View {
        VStack{
            allCoinList
        }
        .background(
        NavigationLink(
            destination: DetailLoadingView(coin: $selectedCoin),
            isActive: $showDetailedView,
            label: {EmptyView()})
        )
        
    }
}

struct Market_Previews: PreviewProvider {
    static var previews: some View {
        Market()
            .environmentObject(dev.marketVM)
        
    }
       
}
extension Market{
    private var allCoinList: some View{
        
        VStack{
            Text("Cryptocurrency List")
                .font(.title)
                .bold()
                .padding(.bottom, 30)
            List{
                ForEach(vm.allCoins){coin in
                   
                CoinRowView(coin: coin, showHoldingsColumn: false)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            .onTapGesture {
                                segue(coin: coin)
                            }
                        
                    
                }
            }
            .listStyle(PlainListStyle())
            Spacer()
        }
        .padding()
        
    }
    private func segue(coin: Coins){
        selectedCoin = coin
        showDetailedView.toggle()
    }
}


