//
//  Info.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Info: Decodable  {
    let seed: String?
    let results, page: Int?
    let version: String?
    
}
