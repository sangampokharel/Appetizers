//
//  EmptyView.swift
//  Appetizers
//
//  Created by sangam pokharel on 15/09/2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing:20){
            Image(systemName: "bag.fill.badge.questionmark")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .foregroundColor(Color("tabBarColor"))
            
            Text("No Orders Found")
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
