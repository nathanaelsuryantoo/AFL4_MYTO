//
//  ContentView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home().tabItem(){
                Image(systemName:"menucard.fill")
                Text("Home")
            };Market().tabItem(){
                Image(systemName:"chart.bar")
                Text("Market")
            };Wishlist().tabItem(){
                Image(systemName: "heart.fill")
                Text("Wishlist")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
