//
//  collections.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 22/08/22.
//

import SwiftUI

struct collections: View {
//    var collectionRow: [GridItem] = [model]
    let data = 500
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    var row = [GridItem]()
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: -100), count: 5)
    
    
    let columns = [
        GridItem(.flexible(), spacing: 100),
        GridItem(.flexible(minimum: 20, maximum: 100)),
        GridItem(.flexible(minimum: 20, maximum: 100))
    ]
    
    var body: some View {
        ScrollView{
        LazyVGrid(columns: gridItemLayout, spacing: 20){
            ForEach(0...data, id: \.self) {_ in
                Image(systemName: "circle.fill")
                    .onTapGesture {
                        print("Yay")
                    }
            }
        }
        }.background(Color(.green))
    }
}

struct collections_Previews: PreviewProvider {
    static var previews: some View {
        collections()
    }
}

