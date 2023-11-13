//
//  AppitizerViewModel.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import Foundation


class AppetizerViewModel : ObservableObject {
    @Published var appetizer = [Appetizers]()
    @Published var error:String=""
    @Published var hasError:Bool = false
    @Published var isLoading:Bool = false
    @Published var selectedAppetizer:Appetizers?
    
    
    init (){
        self.isLoading = true
        Task { try await fetchAppetizers()}
    }
    
    @MainActor
    func fetchAppetizers() async throws {
        do {
            
            self.appetizer = []
            self.appetizer = try await AppetizerService.fetchApitizerData()
            self.hasError = false
            self.isLoading = false
        }catch {
            
            self.hasError = true
            self.error = error.localizedDescription
            print("DEBUG: Error from view model \(error.localizedDescription)")
            self.isLoading = false
            
        }
        
        
    }
    
    
    
}
