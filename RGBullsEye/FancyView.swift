//
//  FancyView.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 28/07/22.
//

import SwiftUI
import UIKit

// MARK: Embedding UIKit components in SwiftUI
struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView()
        return activity
    }
    
}

// MARK: Embedding UIKit components in SwiftUI
struct PageControl: UIViewRepresentable {
    var noOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = noOfPages
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return pageControl
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject {
        var control: PageControl
        init(_ control: PageControl){
            self.control = control
        }
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
        
    }
}

struct FancyView: View {
    @State var isAnimating: Bool = false
    @State var currentPage: Int = 0
    var noOfPages: Int? = 4
    
    func increasingPageCount() {
        if currentPage == noOfPages ?? 2 {
            currentPage = 0
        } else {
            currentPage += 1
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                ActivityIndicator(isAnimating: $isAnimating)
                Button {
                    isAnimating.toggle()
                } label: {
                    if isAnimating {
                        Text("Stop loading")
                    }
                    else {
                        Text("Start loading")
                    }
                }
                Spacer()
                Button {
                    increasingPageCount()
                } label: {
                    Text("Change Page")
                }
                Spacer()
                Text("Current Page: \(currentPage)")
                PageControl(noOfPages: noOfPages ?? 2, currentPage: $currentPage)
            }
        }
    }
}

struct FancyView_Previews: PreviewProvider {
    static var previews: some View {
        FancyView()
    }
}
