//
//  AFL4_0706012010017App.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

@main
struct AFL4_0706012010017App: App {
    
    @StateObject private var vm = MarketViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
