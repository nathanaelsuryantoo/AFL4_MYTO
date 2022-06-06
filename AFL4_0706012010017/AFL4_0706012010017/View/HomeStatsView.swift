//
//  HomeStatsView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 05/06/22.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: MarketViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(spacing: 20){
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 30,
                pinnedViews: [],
                content: {
                    ForEach(vm.statistic){ stat in
                        StatisticView(stat: stat)
                    }
                })
                .padding(.leading, 30)
            
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
