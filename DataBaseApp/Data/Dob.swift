//
//  Dob.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Dob: Decodable  {
    let date: Date
    let age: Int
    
    init(date: Date, age: Int) {
        self.date = date
        self.age = age
    }
}
