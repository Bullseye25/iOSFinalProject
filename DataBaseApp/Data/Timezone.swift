//
//  Timezone.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Timezone: Decodable  {
    let offset, description: String
    
    init(offset: String, description: String) {
        self.offset = offset
        self.description = description
    }
}
