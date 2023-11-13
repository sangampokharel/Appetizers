//
//  OrdersView.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject private var ordersViewModel:OrdersViewModel
    
    var body: some View {
        NavigationStack{
            
            if ordersViewModel.ordersList.isEmpty {
                EmptyView().navigationTitle("My Orders")
            }else{
                VStack {
                    List {
                        ForEach(ordersViewModel.ordersList) { item in
                            AppetizerCell(appetizer: item)
                            
                        }.swipeActions(edge: .trailing, content: {
                            Button("Delete", role: .destructive) {
//                                ordersViewModel.ordersList.remove(atOffsets: index)
                            }
                        })
                        
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("\(232) - Add to order ")
                    } label: {
                        Text("$ 23.44 - Place Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                        
                        
                    }
                    
                    .buttonStyle(BorderedProminentButtonStyle())
                    .controlSize(.regular)
                    .tint(Color("tabBarColor"))
                    
                    .padding(.vertical)
                    
                }    .navigationTitle("My Orders")
            }
            
            
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
