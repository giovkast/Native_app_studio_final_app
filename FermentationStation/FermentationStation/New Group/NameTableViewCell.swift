//
//  NameTableViewCell.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 16/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet var textLab: UITextField?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
