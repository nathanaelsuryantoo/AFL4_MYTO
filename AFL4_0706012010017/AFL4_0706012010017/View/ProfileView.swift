//
//  ProfileView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var vm: MarketViewModel
    @State private var draftProfile = Profile.default

        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    if editMode?.wrappedValue == .active {
                                        Button("Cancel", role: .cancel) {
                                            draftProfile = vm.profile
                                            editMode?.animation().wrappedValue = .inactive
                                        }
                                    }
                    Spacer()
                    EditButton()
                            }
                if editMode?.wrappedValue == .inactive {
                                ProfileSummaryView(profile: vm.profile)
                            } else {
                                EditProfileView(profile: $draftProfile)
                                    .onAppear {
                                        draftProfile = vm.profile
                                    }
                                    .onDisappear {
                                        vm.profile = draftProfile
                                    }
                            }
            }
                   .padding()
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(dev.marketVM)
    }
}
