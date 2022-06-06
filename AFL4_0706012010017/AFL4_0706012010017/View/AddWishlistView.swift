//
//  AddWishlistView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 05/06/22.
//

import SwiftUI

struct WishlistView: View{
    
    @Binding var coin: Coins?
    
    var body: some View {
        ZStack{
            if let coin = coin{
                AddWishlistView(coin: coin)
            }
        }
        
    }
}

struct AddWishlistView: View {
    
    let coin: Coins
    
    init(coin: Coins){
        self.coin = coin
    }
    
    @EnvironmentObject private var vm: MarketViewModel
    @State private var quantityText: String = ""
    
    var body: some View {
        
            VStack{
                Group{
                    CoinImageView(coin: coin)
                        .frame(width: 125, height: 125)
                    Text(coin.name)
                        .padding(.vertical, 10)
                    HStack{
                        Text("Current Value")
                        Spacer()
                        Text(coin.currentPrice.asCurrencyWith2Decimals())
                    }
                    .padding(.top, 40)
                    Divider()
                    HStack{
                        Text("Amount: ")
                        Spacer()
                        TextField("Ex: 1.4", text: $quantityText)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                    Divider()
                    HStack{
                        Text("Current Value:")
                        Spacer()
                        Text(getCurrentValue().asCurrencyWith2Decimals())
                    }
                    .padding(.bottom, 40)
                    Button(action: {
                        print("")
                    }, label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding()
                    })
                }
                Spacer()
            }
            .padding()
        
    }
}

struct AddWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddWishlistView(coin: dev.coin)
            .environmentObject(dev.marketVM)
        }
    }
}

extension AddWishlistView{
    public func getCurrentValue() -> Double{
        if let quantity = Double(quantityText){
            return quantity * (coin.currentPrice )
        }
        return 0
    }
}
