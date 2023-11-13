//
//  APDetailsView.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct APDetailsView: View {
    @Binding var appetizer:Appetizers?
    @EnvironmentObject private var ordersViewModel:OrdersViewModel
    var body: some View {

        if let item = appetizer {
            //card
            ZStack(alignment:.topTrailing) {
                VStack(spacing:30){
                    AsyncImage(url: URL(string: item.imageURL)) { image in
                        image.resizable()
                    } placeholder: { 
                        ProgressView()
                            
                    }
                    .frame(maxWidth:.infinity, maxHeight:200)
             
                    Text(item.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    Text(item.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        
                    
                    HStack(spacing:30){
                        VStack{
                            Text("Calories")
                            
                            
                            Text("\(item.calories)")
                                .font(.title3)
                                .italic()
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        
                        VStack{
                            Text("Carbs")
                            
                            Text("\(item.carbs) g")
                                .font(.title3)
                                .italic()
                        }  .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        VStack{
                            Text("Protein")
                            
                            Text("\(item.protein) g")
                                .font(.title3)
                                .italic()
                        } .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Button {
                        ordersViewModel.orderItem(selectedAppetizer: item)
                    } label: {
                        Text("$\(item.price,specifier: "%.2f") - Add to Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            
                        
                    }
                   
                    .buttonStyle(BorderedProminentButtonStyle())
                    .tint(Color("tabBarColor"))
                    .padding(.vertical)
                    
                    
                    
                }
                
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24,height: 24)
                    .foregroundStyle(.black, .white)
                    .padding(.top,4)
                    .padding(.trailing,4)
                    .zIndex(8)
                    .onTapGesture {
                        appetizer = nil
                    }
               
            } .frame(width: UIScreen.main.bounds.width-70)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
            
       
             
    }
}

struct APDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        APDetailsView(appetizer: .constant( AppetizersResponse.MOCK_SINGLE_APPETIZER))
    }
}
