//
//  viewAllTableViewCell.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class viewAllTableViewCell: UITableViewCell {

    @IBOutlet weak var katydidImage: UIImageView!
    @IBOutlet weak var katydidNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
