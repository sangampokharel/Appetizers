//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject private var ordersViewModel = OrdersViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ordersViewModel)
        }
    }
}
