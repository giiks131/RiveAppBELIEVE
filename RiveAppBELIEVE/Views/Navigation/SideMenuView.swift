//
//  SideMenuView.swift
//  RiveAppBELIEVE
//
//  Created by Aleksandr Shapovalov on 05/01/23.
//

import SwiftUI
import RiveRuntime

struct SideMenuView: View {
    @StateObject var menus = MenuItems()
    @State var selectedMenu: SelectedMenu = .home
    @State var isDarkMode = false
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")

    var body: some View {
        VStack {

            header

            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)

            browse

            Text("HISTORY")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)

            VStack(alignment: .leading, spacing: 0) {

                ForEach(menus.menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)

                    MenuRow(selectedMenu: $selectedMenu, item: item)
                }
            }
            .padding(8)

            Spacer()

            HStack(spacing: 14) {
                menus.menuItems3[0].icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) { newValue in
                        if newValue {
                            menus.menuItems3[0].icon.setInput("active", value: true)

                        } else {
                            menus.menuItems3[0].icon.setInput("active", value: false)
                        }
                    }
                Text(menus.menuItems3[0].text)
                    .customFont(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension SideMenuView {
    var header: some View {
        HStack {
            Image(systemName: "person")
                .padding(12)
                .background(.white.opacity(0.2))
                .mask(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text("Alex Sh.")
                    .customFont(.body)
                Text("iOS Developer")
                    .customFont(.subheadline2)
                    .opacity(0.6)
            }
            Spacer()
        }
        .padding()
    }

    var browse: some View {

        VStack(alignment: .leading, spacing: 0) {

            ForEach(menus.menuItems) { item in
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                    .padding(.horizontal)

                MenuRow(selectedMenu: $selectedMenu, item: item)
            }
        }
        .padding(8)
    }

}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
