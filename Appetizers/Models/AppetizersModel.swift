//
//  AppetizersModel.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import Foundation

// MARK: - Welcome
struct AppetizersResponse: Decodable,Hashable {
    let request: [Appetizers]
    static let MOCK_DATA =  [
        MOCK_SINGLE_APPETIZER,
        MOCK_SINGLE_APPETIZER,
        MOCK_SINGLE_APPETIZER,
        MOCK_SINGLE_APPETIZER,
        MOCK_SINGLE_APPETIZER,
        MOCK_SINGLE_APPETIZER,
    ]
    
    static let MOCK_SINGLE_APPETIZER =   Appetizers(carbs: 2, id: 001, price: 34.56,
                                                    imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                                    calories: 3,
                                                    protein: 4,
                                                    description: "This perfectly thin cut just melts in your mouth.",
                                                    name: "Asian Flank Steak")
    
}

// MARK: - Request
struct Appetizers: Decodable,Hashable,Identifiable {
    let carbs, id: Int
    let price: Double
    let imageURL: String
    let calories, protein: Int
    let description, name: String
    
    
    
    
}



