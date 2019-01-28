//
//  Name.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Name: Decodable  {
    let title, first, last: String
    
    init(title: String, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
}
