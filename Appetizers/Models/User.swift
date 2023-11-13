//
//  User.swift
//  Appetizers
//
//  Created by sangam pokharel on 13/09/2023.
//

import Foundation

struct User:Codable {
    let firstName:String
    let lastName:String
    let email:String
    let birthDate:Date
    let extraNapkins:Bool
    let frequentRefils:Bool
}
