//
//  Home.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var vm: MarketViewModel
    @State private var showingProfile = false
    @Binding var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading){
                Text(profile.username)
                    .bold()
                    .padding(.bottom, 1)
                    .padding(.top, 20)
                    .foregroundColor(Color.black)
            
            Text("Welcome Back 👋")
                .font(.caption)
                .padding(.bottom, 40)
            HStack{
                Spacer()
                VStack{
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: 40, height: 40)
                    }
                    .offset(y: 40)
                    .padding(.top, -35)
                    .zIndex(1)
                    .sheet(isPresented: $showingProfile) {
                        ProfileView()
                    }
                    
                    Image("ProfileRectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                Spacer()
            }
            VStack{
                HStack{
                    Spacer()
                    Text("MYTO")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 10)
                HStack{
                    Text("All your crypto needs")
                        .bold()
                        .font(.title3)
                }
            }
            .offset(y: -135)
            .foregroundColor(Color.white)
            Text("Today Statistic")
                .font(.title2)
                .bold()
            HomeStatsView()
            Spacer()
        }
        .padding(.leading, 40)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
            Home(profile: .constant(.default))
            .environmentObject(dev.marketVM)
        
    }
}
