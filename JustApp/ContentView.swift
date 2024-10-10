//
//  ContentView.swift
//  JustApp
//
//  Created by Oleg Ten on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: TabModel = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                TabView(selection: $activeTab) {
                    Tab.init(value: .home) {
                        Text("Home")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    Tab.init(value: .notifications) {
                        Text("Search")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    Tab.init(value: .search) {
                        Text("Notification")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    Tab.init(value: .settings) {
                        Text("Settings")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                }
            }
            CustomTabBar(activeTab: $activeTab)
        }
    }
}

#Preview {
    ContentView()
}
