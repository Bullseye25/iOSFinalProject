//
//  DetailsViewController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var result: Result?
    
    @IBOutlet weak var userPicture: UIImageView!
    
    @IBOutlet weak var _title: UILabel!
    
    @IBOutlet weak var _firstName: UILabel!
    
    @IBOutlet weak var _lastName: UILabel!
    
    @IBOutlet weak var _street: UILabel!
    
    @IBOutlet weak var _email: UILabel!
    
    @IBOutlet weak var _phone: UILabel!
    
    @IBOutlet weak var _cell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _title.text = result?.name.title
        _firstName.text = result?.name.first
        _lastName.text = result?.name.last
        _street.text = result?.location.street
        _email.text = result?.email
        _phone.text = result?.phone
        _cell.text = result?.cell
        
//        self.view.backgroundColor = UIColor(red: 198/255, green: 172/255, blue: 143/255, alpha: 0.1)
        
    }
}

