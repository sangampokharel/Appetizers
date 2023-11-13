//
//  AppetizerView.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct AppetizerView: View {
    @StateObject private var appetizerViewModel = AppetizerViewModel()
    @EnvironmentObject private var ordersViewModel:OrdersViewModel
    var body: some View {
        NavigationStack {
            
            if appetizerViewModel.isLoading {
                ProgressView().font(.largeTitle)
            }else{
                ZStack(alignment: .center) {
                    List {
                        ForEach(appetizerViewModel.appetizer, id: \.self) { item in
                            AppetizerCell(appetizer: item)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        appetizerViewModel.selectedAppetizer = item
                                      
                                    }
                                }
                        }
                    }.listStyle(.plain)
                        .refreshable {
                            Task { try await appetizerViewModel.fetchAppetizers() }
                        }
                        .blur(radius: appetizerViewModel.selectedAppetizer != nil ? 10 : 0)
                        .alert(isPresented: $appetizerViewModel.hasError, content: {
                            Alert(title: Text(appetizerViewModel.error))
                        })
                        .disabled(appetizerViewModel.selectedAppetizer != nil)
                    
                    if appetizerViewModel.selectedAppetizer != nil   {
                        APDetailsView(appetizer: $appetizerViewModel.selectedAppetizer)
                    }
                  
                }
                .navigationTitle("Appetizers")

                
                    
                
            }
            
            
            
            
        }
    }
}

struct AppetizerView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerView()
    }
}
