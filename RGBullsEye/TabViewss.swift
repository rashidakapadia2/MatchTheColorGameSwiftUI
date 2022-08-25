//
//  TabViewss.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 10/08/22.
//

import SwiftUI

struct TabViewss: View {
    var body: some View {
        TabView{
            NavigationView {
                Forms(username: "Wheeee")
              }
              .tabItem({
                  Text("Artworks")
              })
              
              NavigationView {
                Practice()
              }
              .tabItem({ Image(systemName: "music.mic") })
            NavigationView {
                FancyView()
            }.tabItem({
                Text("😉 🥶 \u{24} \u{e008} \u{2717}")
            })
        }
    }
}

struct TabViewss_Previews: PreviewProvider {
    static var previews: some View {
        TabViewss()
    }
}
