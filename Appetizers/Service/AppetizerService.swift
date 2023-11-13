//
//  AppetizerService.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import Foundation


enum APIError:Error {
    case invalidUrl
    case invalidData
    case invalidResponse
    case unableToComplete
    
    
}

class AppetizerService {
    
    static private let API_URL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    
    static func fetchApitizerData() async throws -> [Appetizers]{
        
        guard let url = URL(string:API_URL) else {throw APIError.invalidUrl}
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let parsedData = try? JSONDecoder().decode(AppetizersResponse.self, from: data)
        
        return parsedData?.request ?? []
        
        
    }
    
}
