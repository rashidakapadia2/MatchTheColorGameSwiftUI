//
//  Form.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 28/07/22.
//

import SwiftUI

struct Forms: View {
    @State var isOn: Bool = true
    @State var username: String
    
    var body: some View {
        Form {
            VStack{
                Text("Settings").fontWeight(.bold).font(.largeTitle)
                Spacer()
                HStack{
                    Text("PROFILE").bold().font(.title3)
                    Spacer()
                }
                TextField(text: $username) {
                    Text("Username")
                }
                Toggle(isOn: $isOn) {
                    Text("Private Account")
                }
            }
            Section(header: Text(Date(),format: .dateTime)) {
                Text("Version")
                Text("Update to latest version")
            }
            Link("Privacy Policy", destination: (URL(string: "https://www.simpleswiftguide.com/swiftui-form-tutorial-how-to-create-and-use-form-in-swiftui/")!))
            Section(header: Text("Notifications")){
                Rectangle().animation(.linear, value: 4)
                    .foregroundColor(.gray)
                HStack{
                    Circle().fill(Color.green).transition(.opacity)
                }
            }
        }
    }
}

struct Forms_Previews: PreviewProvider {
    static var previews: some View {
        Forms(username: "Rashida")
    }
}
