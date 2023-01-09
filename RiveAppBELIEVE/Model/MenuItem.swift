//
//  MenuItem.swift
//  RiveAppBELIEVE
//
//  Created by Aleksandr Shapovalov on 08/01/23.
//

import Foundation
import RiveRuntime

struct MenuItem: Identifiable {
    var id = UUID()

    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}
