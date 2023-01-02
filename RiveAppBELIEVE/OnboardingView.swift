//
//  OnboardingView.swift
//  RiveAppBELIEVE
//
//  Created by Aleksandr Shapovalov on 02/01/23.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let buttonStart = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
           background
            buttonCourse
            
        }
    }
    
    
}


extension OnboardingView {
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
    
    var buttonCourse: some View {
        VStack {
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
              
            
            buttonStart.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    buttonStart.play(animationName: "active")
            }
        }
    }
    
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
