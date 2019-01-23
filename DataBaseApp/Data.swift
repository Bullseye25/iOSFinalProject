//
//  Data.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import Foundation
import UIKit

class Data
{
    var title: String
    var firstName: String
    var lastName: String
    var street: String
    var city: String
    var email: String
    var phone: Int
    var cell: Int
    var largePicture: UIImage?
    
    init(title: String,
         firstName: String,
         lastName: String,
         street: String,
         city: String,
         email: String,
         phone: Int,
         cell: Int,
         largePicture: UIImage?)
    {
        self.title = title
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.email = email
        self.phone = phone
        self.cell = cell
        
        if let image = largePicture
        {
            self.largePicture = image
        }
    }

}
