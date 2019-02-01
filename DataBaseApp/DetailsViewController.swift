//
//  DetailsViewController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/27/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

import SpriteKit

class DetailsViewController: UIViewController
{
    var result: Result?
    
    @IBOutlet weak var _userPicture: UIImageView!
    
    @IBOutlet weak var _title: UILabel!
    
    @IBOutlet weak var _firstName: UILabel!
    
    @IBOutlet weak var _lastName: UILabel!
    
    @IBOutlet weak var _street: UILabel!
    
    @IBOutlet weak var _email: UILabel!
    
    @IBOutlet weak var _phone: UILabel!
    
    @IBOutlet weak var _cell: UILabel!
    
    @IBOutlet weak var _background: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        _title.text = "Title: "+" "+(result?.name!.title!.uppercased())!
        _firstName.text = "First Name: "+" "+(result?.name!.first!.uppercased())!
        _lastName.text = "Lase Name: "+" "+(result?.name!.last!.uppercased())!
        _street.text = "Street: "+" "+(result?.location?.street)!
        _email.text = "Email: "+" "+(result?.email)!
        _phone.text = "Phone: "+" "+(result?.phone)!
        _cell.text = "Cell: "+" "+(result?.cell)!
        let url = URL(string: (result!.picture?.large)!)
        _userPicture.image = result?.picture?.getImg(url: url!)
        _userPicture.frame.size.height = _background.frame.size.height/8
        _background.backgroundColor = UIColor(displayP3Red: 234/255, green: 224/255, blue: 213/255, alpha: 0.1)
        
    }
}

