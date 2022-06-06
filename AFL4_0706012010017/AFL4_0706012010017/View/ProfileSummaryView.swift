//
//  ProfileSummaryView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct ProfileSummaryView: View {
    @EnvironmentObject var vm: MarketViewModel
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                
                Text("Profile")
                        .font(.title)
                        .bold()
               
                Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(Color.orange)
                        .frame(width: 100, height: 100)
                
                Text(profile.username)
                    .bold()
                    .font(.title2)
                    .padding(.top, 20)

                Text(profile.email)
                    .bold()
                    .font(.headline)
                    .scaledToFill()
                HStack{
                    VStack(alignment: .leading){
                        Text("Birthday")
                            .font(.caption)
                            .padding(.top, 40)
                            .foregroundColor(Color.gray)
                        Text(profile.birthday)
                            .bold()
                            .padding(.bottom, 10)
                        Text("Address")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        Text(profile.address)
                            .bold()
                            .padding(.bottom, 10)
                        Text("Phone")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        Text(profile.phone)
                            .bold()
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: Profile.default)
            .environmentObject(dev.marketVM)
    }
}
