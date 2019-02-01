//
//  DataViewCell.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell
{

    @IBOutlet weak var _profilePicture: UIImageView!
    
    @IBOutlet weak var _name: UILabel!
    
    @IBOutlet weak var _email: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func load(_ result:Result)
    {
        _name.text = (result.name!.first?.uppercased())!+" "+((result.name?.last)?.uppercased())!
        _email.text = result.email
        let url = URL(string: (result.picture?.thumbnail)!)
        _profilePicture.image = result.picture?.getImg(url: url!)
        
        imgBorderControl()
    }
    
    func imgBorderControl()
    {
        let img = _profilePicture
        img!.layer.cornerRadius = img!.frame.size.width/2
        img!.clipsToBounds = true
    }
    
    func getColor(row: Int) -> UIColor
    {
        var red: CGFloat?
        var green: CGFloat?
        var blue: CGFloat?
        
        red = 234/255
        green = 224/255
        blue = 213/255
        
        if row % 2 == 0
        {
            return UIColor(displayP3Red: red!, green: green!, blue: blue!, alpha: 0.1)
        }
        
        return UIColor(displayP3Red: red!, green: green!, blue: blue!, alpha: 0.4)
    }
    
}
