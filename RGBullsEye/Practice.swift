//
//  Practice.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 08/08/22.
//

import SwiftUI

struct Practice: View {
    
    @GestureState var rotateBy: Angle = Angle(degrees: 15)
    @GestureState var magnifyBy = 1.0
    @State var isDragging: Bool = false
    @State var isDay: Bool = true
    @State var degree: Double = 0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    var rotation: some Gesture {
        RotationGesture()
            .updating($rotateBy) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    var drag: some Gesture {
        DragGesture()
            .onChanged{ _ in self.isDragging = true }
            .onEnded{ _ in self.isDragging = false }
    }
    
    var body: some View {
        TabView{
            
        VStack{
//            Rectangle()
//                .frame(width: 200, height: 200)
//                .rotationEffect(rotateBy)
//                .gesture(rotation)
//            Circle()
//                .frame(width: 100, height: 100, alignment: .center)
//                .scaleEffect(magnifyBy)
//                .gesture(magnification)
//            Rectangle()
//                .inset(by: 10)
//                .fill(isDragging ? .red : .blue)
//                .frame(width: 100, height: 100, alignment: .center)
//                .rotationEffect(rotateBy)
//                .gesture(drag)
//                .gesture(rotation)
            
            Text("Tap Me!")
                .gesture(TapGesture(count: 2)
                    .onEnded() { _ in
                            print("Tapped twice")
                        })
            
            
            Image(systemName: isDay ? "sun.min" : "moon")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .rotationEffect(Angle.degrees(degree))
                .gesture(TapGesture(count: 2)
                    .onEnded() { _ in
                        self.isDay.toggle()
                    }

                    .exclusively(before: RotationGesture()
                        .onChanged() { angle in
                            self.degree = angle.degrees
                        }
                    )
            )
        }
        }
    }
}

struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice()
    }
}
