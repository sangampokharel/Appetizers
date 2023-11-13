//
//  OrdersViewModel.swift
//  Appetizers
//
//  Created by sangam pokharel on 15/09/2023.
//

import Foundation

class OrdersViewModel:ObservableObject{
    
    @Published var ordersList = [Appetizers]()
    
    
    
    func orderItem(selectedAppetizer:Appetizers){
        ordersList.append(selectedAppetizer)
    }
    
}
