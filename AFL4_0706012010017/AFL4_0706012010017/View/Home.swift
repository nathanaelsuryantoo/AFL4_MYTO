//
//  Home.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var vm: MarketViewModel
    
    var body: some View {
        
            VStack{
                HomeStatsView()
            }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home()
            .environmentObject(dev.marketVM)
        }
    }
}
