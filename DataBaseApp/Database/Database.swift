//
//  Data.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Database: Decodable
{
    let results: [Result]?
    let info: Info?
}
