//
//  HomeStatsView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 05/06/22.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: MarketViewModel
    var body: some View {
        VStack{
            ForEach(vm.statistic){ stat in
                StatisticView(stat: stat)
            }
            .frame(width: 100, alignment: .leading)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView()
            .environmentObject(dev.marketVM)
    }
}
