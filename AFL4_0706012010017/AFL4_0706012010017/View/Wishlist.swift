//
//  Wishlist.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct Wishlist: View {
    
    @EnvironmentObject private var vm: MarketViewModel
    
    var body: some View {
        VStack{
            allCoinList
        }
        
    }
}

struct Wishlist_Previews: PreviewProvider {
    static var previews: some View {
        Wishlist()
            .environmentObject(dev.marketVM)
    }
}

extension Wishlist{
    private var allCoinList: some View{
        VStack{
            Text("My Wishlist")
                .font(.title)
                .bold()
            List{
                ForEach(vm.wishListCoins){coin in
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }
}
