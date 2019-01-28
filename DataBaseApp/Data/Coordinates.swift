//
//  Coordinates.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Coordinates: Decodable  {
    let latitude, longitude: String
    
    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
