//
//  DataViewCell.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func load(_ data:Data)
    {
        TitleLabel.text = data.title
        EmailLabel.text = data.email
        ProfileImage.image = data.largePicture
    }
    
}
