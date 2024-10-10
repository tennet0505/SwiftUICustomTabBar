//
//  LaunchScreen.swift
//  JustApp
//
//  Created by Oleg Ten on 10/10/2024.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var showMeView: Bool = false
    @State private var angel: Double = 360
    @State private var opacity: Double = 1
    @State private var scale: Double = 1
    
    var body: some View {
        Group {
            if showMeView {
                ContentView()
            } else {
                ZStack {
                    Image("logo200")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(Angle(degrees: angel),
                                          axis: (x: 0, y: 1, z: 0))
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2)) {
                angel = 0
                opacity = 0
                scale = 3
            }
            withAnimation(.linear.delay(1.75)) {
                showMeView = true
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
