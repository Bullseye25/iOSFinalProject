//
//  Picture.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation
import UIKit

struct Picture: Decodable  {
    
    let large, medium, thumbnail: String//UIImage?

        init(large: String, medium: String, thumbnail: String) {
//    init(large: UIImage?, medium: UIImage?, thumbnail: UIImage?) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
