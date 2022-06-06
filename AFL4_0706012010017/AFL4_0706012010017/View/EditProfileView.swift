//
//  EditProfileView.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var profile: Profile
    

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
               }
            HStack {
                Text("Email").bold()
                Divider()
                TextField("Email", text: $profile.email)
            }
            HStack {
                Text("Birthday").bold()
                Divider()
                TextField("Birthday", text: $profile.birthday)
            }
            HStack {
                Text("Address").bold()
                Divider()
                TextField("Address", text: $profile.address)
            }
            HStack {
                Text("Phone").bold()
                Divider()
                TextField("Phone", text: $profile.phone)
            }
               

            }
        }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(profile: .constant(.default))
    }
}
