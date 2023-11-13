//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import SwiftUI


class AccountViewModel:ObservableObject {
    @Published var firstName:String = ""
    @Published var lastName:String = ""
    @Published var email:String = ""
    @Published var birthDay:Date = Date()
    @Published var  isExtraNapking:Bool = true
    @Published var  frequentReffils:Bool = false
    
    @AppStorage("users") private var user:Data?
    
    var isFieldValid:Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !birthDay.description.isEmpty
        
    }
    
    var isEmailValid:Bool {
        return email.contains("@")
    }
    
    @Published var dataStored:Bool = false
    
    init(){
        retrievePersonalInfos()
    }
    
    func sendPersonalInfos(){
        if isFieldValid  {
            if isEmailValid {
                print("Save changes done")
                let user = User(firstName: firstName,
                                lastName: lastName,
                                email: email,
                                birthDate: birthDay,
                                extraNapkins: isExtraNapking,
                                frequentRefils: frequentReffils)
                
                do{
                    let userData = try JSONEncoder().encode(user)
                    self.user = userData
                    self.dataStored = true
                    
                }catch{
                    self.dataStored = false
                    print("DEBUG: failed to stored data \(error.localizedDescription)")
                }
                
                
                
            }else{
                print("Please enter valid email")
            }
        }else{
            // something
            print("All fields are required")
            
        }
    }
    
    func retrievePersonalInfos(){
        do{
            guard let userInfo = user else {return}
            
            let decodedUserInfo = try JSONDecoder().decode(User.self, from: userInfo )
            
            print("/User info fetched \(decodedUserInfo)")
            
            self.firstName = decodedUserInfo.firstName
            self.lastName = decodedUserInfo.lastName
            self.email = decodedUserInfo.email
            self.birthDay = decodedUserInfo.birthDate
            self.isExtraNapking = decodedUserInfo.extraNapkins
            self.frequentReffils = decodedUserInfo.frequentRefils
            
            
        }catch{
            print("DEBUG: Failed to retrieve information ")
        }
    }
    
}

