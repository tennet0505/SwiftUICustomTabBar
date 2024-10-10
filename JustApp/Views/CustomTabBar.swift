//
//  CustomTabBar.swift
//  JustApp
//
//  Created by Oleg Ten on 10/10/2024.
//

import SwiftUI

struct CustomTabBar: View {
    
    var activeForeground: Color = .white
    var activeBackground: Color = .blue
    @Binding var activeTab: TabModel
    @Namespace private var animation
    @State private var tabLocation: CGRect = .zero
    
    var body: some View {
        let status = activeTab == .home || activeTab == .search
        HStack(spacing: !status ? 0 : 12) {
            HStack(spacing: 0) {
                ForEach(TabModel.allCases, id: \.rawValue) { tab in
                    Button {
                        activeTab = tab
                    } label: {
                        HStack(spacing: 0.5) {
                            Image(systemName: tab.rawValue)
                                .font(.title3.bold())
                                .frame(width: 30, height: 30)
                            if activeTab == tab {
                                Text(tab.title)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            }
                        }
                        .foregroundStyle(activeTab == tab ? activeForeground : .gray)
                        .padding(.vertical, 2)
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        .contentShape(.rect)
                        .background {
                            if activeTab == tab {
                                Capsule()
                                    .fill(.clear)
                                    .onGeometryChange(for:  CGRect.self, of: {
                                        $0.frame(in: .named("TABBARVIEW"))
                                    }, action:  { newValue in
                                        tabLocation = newValue
                                    })
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .background(alignment: .leading) {
                Capsule()
                    .fill(activeBackground.gradient)
                    .frame(width: tabLocation.width, height: tabLocation.height)
                    .offset(x: tabLocation.minX)
            }
            .coordinateSpace(name: "TABBARVIEW")
            .padding(.horizontal, 5)
            .frame(height: 45)
            .background(
                .background
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: -5, y: -5)),
                in: .capsule
            )
            .zIndex(10)
           
            Button {
                
            } label: {
                Image(systemName: activeTab == .home ? "person.fill" : "slider.vertical.3")
                    .font(.title3)
                    .frame(width: 42, height: 42)
                    .foregroundStyle(activeForeground)
                    .background(activeBackground.gradient)
                    .clipShape(.circle)
            }
            .allowsHitTesting(status)
            .offset(x: status ? 0 : -20)
            .padding(.leading, status ? 0 : -42)
        }
        
        
        .padding(.bottom, 5)
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    ContentView()
}
