//
//  HomeTableViewCell.swift
//  Ayo~Bro
//
//  Created by GW_19 on 08/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var selectButton: UIButton!
    @IBOutlet var regionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
