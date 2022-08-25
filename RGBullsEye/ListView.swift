//
//  ListView.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 27/07/22.
//

import SwiftUI

struct ListView: View {
    @State var text: String
    @State private var isSecured: Bool = true
    private var title: String = "PASSWORD"
    
    init(_ title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    var prodArr: [ProductDetails] = [
        ProductDetails(id: 1, name: "Table", description: "sdfghjk"),
        ProductDetails(id: 2, name: "Sofa", description: "dfghjk"),
        ProductDetails(id: 3, name: "Chairs", description: "xcvbnm"),
        ProductDetails(id: 4, name: "Cupboard", description: "sdfghj")
    ]
    var prod = [ProductDetails]()
    var body: some View {
        VStack {
            Text("NO products match your Search")
            if !prodArr.isEmpty {
                List(prodArr){ item in
                    VStack{
                        Text("\(item.id)")
                        Text("\(item.name)")
                        Text("\(item.description)")
                            .background(Color.gray)
                    }
                }
            }
            VStack{
                HStack {
                    Group {
                        if isSecured {
                            SecureField(title, text: $text)
                        } else {
                            TextField(title, text: $text)
                        }
                    }.padding(.trailing, 32)
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    
                }.padding()
                Text("\(text)")
                    .animation(.easeInOut(duration: 5))
                    .background(Color.red)
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView("PASS", text: "Rashida1@")
    }
}
