//
//  Wohooo.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 28/07/22.
//

import SwiftUI
import UIKit

enum ScrollDirection {
    case forward
    case reverse
    
    var direction: UIPageViewController.NavigationDirection {
        switch self {
            case .forward: return .forward
            case .reverse: return .reverse
        }
    }
}

// MARK: Embedding UIKit ViewController in SwiftUI
struct PagesViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var isReverseScrollingEnabled: ScrollDirection
    @Binding var currentController: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal)
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[currentController]], direction: isReverseScrollingEnabled.direction, animated: true)
    }
}

struct Page: View {
    @State var isReverseScrollingEnabled: ScrollDirection = .forward
    @State var currentController: Int
    let colorArr: [UIColor] = [.white,.blue,.green,.yellow,.brown]
    
    var aVC: [UIViewController]{
        var vcs = [UIViewController]()
        
        for i in 0..<colorArr.count {
            let vc = UIViewController()
            vc.view.backgroundColor = colorArr[i]
            vcs.append(vc)
        }
        return vcs
    }
    
    var body: some View {
        ZStack{
            VStack{
                PagesViewController(controllers: aVC, isReverseScrollingEnabled: $isReverseScrollingEnabled, currentController: $currentController)
                    .background(Color.red)
                    .overlay(alignment: .topTrailing) {
                        Text("Page \(currentController + 1)  ")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding()
                    }
                
                HStack{
                    Button {
                        isReverseScrollingEnabled = .reverse
                        if currentController == 0  {
                            currentController = colorArr.count - 1
                        } else {
                            currentController -= 1
                        }
                    } label: {
                        Text("Previous Page")
                    }
                    Button {
                        isReverseScrollingEnabled = .forward
                        if currentController == colorArr.count - 1 {
                            currentController = 0
                        } else {
                            currentController += 1
                        }
                    } label: {
                        Text("Next Page")
                    }
                }
                Spacer()
            }
        }
    }
}

struct Page_Previews: PreviewProvider {
    static var previews: some View {
        Page(currentController: 0)
    }
}

