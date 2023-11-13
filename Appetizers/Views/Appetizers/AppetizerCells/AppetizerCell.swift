//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct AppetizerCell: View {
    
    let appetizer:Appetizers
    var body: some View {
        HStack(spacing:20){
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 100)
            .cornerRadius(8)
            
            
            VStack(alignment:.leading,spacing: 10){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: AppetizersResponse.MOCK_SINGLE_APPETIZER)
    }
}
