//
//  Login.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation

struct Login: Decodable  {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
    
}
