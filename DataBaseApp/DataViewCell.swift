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
    
    var Picture: String?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func load(_ result:Result, _ index: Int)
    {
        TitleLabel.text = result.name!.title
        Picture = result.picture?.thumbnail
    }
    
}
