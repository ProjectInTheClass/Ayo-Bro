
//
//  DetailInfoTableViewCell.swift
//  Ayo~Bro
//
//  Created by 전정준 on 22/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit
let detailInfoCell = DetailInfoTableViewCell()

class DetailInfoTableViewCell:UITableViewCell{
    
    @IBOutlet var title: UILabel!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var sangse: UILabel!
    @IBOutlet var explain: UILabel!
    
    @IBOutlet var explain1: UILabel!
    @IBOutlet var explain2: UILabel!
    @IBOutlet var explain3: UILabel!
    @IBOutlet var explain4: UILabel!
    @IBOutlet var explain5: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
