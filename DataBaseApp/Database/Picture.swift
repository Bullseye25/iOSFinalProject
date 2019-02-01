//
//  Picture.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation
import UIKit

struct Picture: Decodable
{    
    let large, medium, thumbnail: String?
    
    func getImg(url: URL) -> UIImage
    {
        let data = try? Data(contentsOf: url)
        
        if let imageData = data
        {
            let img = UIImage(data: imageData)!
            return img
        }
        print("Unable to Get the Image")
        return UIImage()
    }
}
