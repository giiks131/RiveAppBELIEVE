//
//  MenuItems.swift
//  RiveAppBELIEVE
//
//  Created by Aleksandr Shapovalov on 08/01/23.
//

import SwiftUI
import RiveRuntime

class MenuItems: ObservableObject {
    @Published var menuItems = [
        MenuItem (text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName:"HOME_interactivity", artboardName: "HOME"), menu: .home),
        MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH" ), menu: .search),
        MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
        MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
    ]
    
    @Published var menuItems2 = [
        MenuItem (text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName:"TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
        MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL" ), menu: .notifications)
    ]
    
    @Published var menuItems3 = [
        MenuItem (text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName:"SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkMode)
    ]
}

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkMode
    
}
