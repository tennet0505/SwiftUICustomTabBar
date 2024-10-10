//
//  Tab.swift
//  JustApp
//
//  Created by Oleg Ten on 10/10/2024.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case notifications = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .notifications: return "Notifications"
        case .settings: return "Settings"
        }
    }
}
