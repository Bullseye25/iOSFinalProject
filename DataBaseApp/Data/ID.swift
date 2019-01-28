//
//  ID.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct ID: Decodable  {
    let name, value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
