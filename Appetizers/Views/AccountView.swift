//
//  AccountView.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI

struct AccountView: View {
  @StateObject private var accountViewModel = AccountViewModel()
    var body: some View {
        NavigationStack{
            Form {
                Section(header:Text("Personal Info")){
                    List {
                        TextField("First Name", text: $accountViewModel.firstName)
                        TextField("Last Name", text: $accountViewModel.lastName)
                        TextField("Email", text: $accountViewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        DatePicker("Birthday", selection: $accountViewModel.birthDay, displayedComponents: .date)
                        Button("Save Changes") {
                            accountViewModel.sendPersonalInfos()
                        }.accentColor(Color("tabBarColor"))
                    }
                }
               
                
                Section("Requests") {
                    List {
                        Toggle("Extra Napkins", isOn: $accountViewModel.isExtraNapking)
                        Toggle("Frequent Refiils", isOn: $accountViewModel.frequentReffils)
                    } .tint(Color("tabBarColor"))

                }
                
               
               
            }
            .alert(isPresented: $accountViewModel.dataStored, content: {
               Alert(title: Text("Data Stored Successfully !!!"))
            })
            .navigationTitle("Account")
        }
        
       
       
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
