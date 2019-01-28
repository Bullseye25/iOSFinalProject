//
//  Result.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Result: Decodable  {
    
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
    
    init(gender: String, name: Name, location: Location, email: String, login: Login, dob: Dob, registered: Dob, phone: String, cell: String, id: ID, picture: Picture, nat: String) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.login = login
        self.dob = dob
        self.registered = registered
        self.phone = phone
        self.cell = cell
        self.id = id
        self.picture = picture
        self.nat = nat
    }
}
