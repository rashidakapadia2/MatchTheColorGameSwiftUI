//
//  Pages.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 28/07/22.
//

import SwiftUI
import UIKit

// MARK: Embedding UIKit ViewController in SwiftUI
struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var isReverseScrollingEnabled: Bool
    @Binding var currentController: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        !isReverseScrollingEnabled ?
        pageViewController.setViewControllers([controllers[currentController]], direction: .forward, animated: true) :
        pageViewController.setViewControllers([controllers[currentController]], direction: .reverse, animated: true)
    }
}

struct Pages: View {
    @State var isReverseScrollingEnabled: Bool = false
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
                PageViewController(controllers: aVC, isReverseScrollingEnabled: $isReverseScrollingEnabled, currentController: $currentController).background(Color.red)
                HStack{
                    Button {
                        isReverseScrollingEnabled = true
                        if currentController == 0  {
                            currentController = colorArr.count - 1
                        } else {
                            currentController -= 1
                        }
                        print(currentController)
                    } label: {
                        Text("Previous Page")
                    }
                    Button {
                        isReverseScrollingEnabled = false
                        if currentController == colorArr.count - 1 {
                            currentController = 0
                        } else {
                            currentController += 1
                        }
                        print(currentController)
                    } label: {
                        Text("Next Page")
                    }
                }
                Spacer()
            }
        }
    }
}

struct Pages_Previews: PreviewProvider {
    static var previews: some View {
        Pages(currentController: 0)
    }
}
