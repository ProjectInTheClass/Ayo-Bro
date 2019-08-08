//
//  HomeRegionTableViewCell.swift
//  Ayo~Bro
//
//  Created by A09 on 07/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class HomeRegionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var regionImage: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
