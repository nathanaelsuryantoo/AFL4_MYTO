//
//  CoinRowView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 04/06/22.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coins
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0){
            if showHoldingsColumn{
                wishlistlist
            }else{
                cryptolist
            }
        }
        .font(.subheadline)
        .background(
            Color.accentColor.opacity(0.001)
        )
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingsColumn: false)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)        }
        
    }
}

extension CoinRowView{
    private var leftColumn: some View{
        HStack{
            
                CoinImageView(coin: coin)
                    .frame(width: 30, height: 30)
                Text(coin.symbol.uppercased())
                    .font(.headline)
                    .padding(.leading, 6)
                    .foregroundColor(Color.gray)
        }
    }
    private var centerColumn: some View{
        VStack{
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.yellow)
    }
    private var rightColumn: some View{
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .font(.title3)
                .bold()
                .foregroundColor(Color.black)
            Text(coin.priceChangePercentage24H.asPercentString())
                .foregroundColor(
                    (coin.priceChangePercentage24H ) >= 0 ?
                    Color.green : Color.red)
                                 
            
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    private var cryptolist: some View{
        HStack{
            CoinImageView(coin: coin)
                    .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                    .font(.headline)
                    .padding(.leading, 6)
                    .foregroundColor(Color.gray)
                    .frame(width: 70, alignment: .leading)
            Text(coin.currentPrice.asCurrencyWith2Decimals())
                .font(.title3)
                .bold()
                .frame(width: 120, alignment: .leading)
            Spacer()
            Text(coin.priceChangePercentage24H.asPercentString())
            Image(systemName: "triangle.fill")
                .font(.caption2)
                .rotationEffect(
                    Angle(degrees:(coin.priceChangePercentage24H) >= 0 ? 0 : 180))
                .foregroundColor((coin.priceChangePercentage24H) >= 0 ? Color.green : Color.red)
        }
    }
    private var wishlistlist: some View{
        HStack{
            Spacer()
            CoinImageView(coin: coin)
                    .frame(width: 30, height: 30)
            Spacer()
            VStack(alignment: .leading){
                Text((coin.currentHoldings ?? 0).asNumberString() + " \(coin.symbol.uppercased())")
                    .font(.title3)
                    .bold()
                Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        
    }
}
