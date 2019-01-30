//
//  Location.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Location: Decodable  {
    let street, city, state: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
    
}
