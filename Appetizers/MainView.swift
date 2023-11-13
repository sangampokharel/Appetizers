//
//  ContentView.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var ordersViewModel:OrdersViewModel
    var body: some View {
        TabView {
                AppetizerView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                AccountView()
                   .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
                OrdersView()
                    .tabItem {
                        Image(systemName: "bag")
                        Text("Orders")
                    }.badge(ordersViewModel.ordersList.count)
            }.accentColor(Color("tabBarColor"))
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
