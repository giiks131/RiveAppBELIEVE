//
//  OnboardingView.swift
//  RiveAppBELIEVE
//
//  Created by Aleksandr Shapovalov on 02/01/23.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    @State var showModal = false
    @Binding var showLogin: Bool
    
    let buttonStart = RiveViewModel(fileName: "button")
    
    
    var body: some View {
        ZStack {
            background
            loginContent
                .offset(y: showModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
            
            Button {
                withAnimation {
                    showLogin = false
                }
            }
        label: {
            Image(systemName: "xmark")
                .frame(width: 36, height: 36)
                .background(.black)
                .foregroundColor(.white)
                .mask(Circle())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
        .offset(y: showModal ? -200 : 80)
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
    
    var loginContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design \n& code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            buttonStart.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the journey", systemImage: "arrow.forward")
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    })
                }
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showLogin: .constant(true))
    }
}
