//
//  RealHomeHomeTableViewCell.swift
//  Ayo~Bro
//
//  Created by 전정준 on 24/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class RealHomeHomeTableViewCell : UITableViewCell {
    @IBOutlet var ColloectionViewInCell2: UICollectionView!
    @IBOutlet var LabelInCell2: UILabel!
    @IBOutlet var CollectionViewInCell3: UICollectionView!
    @IBOutlet var LabelInCell3: UILabel!
    @IBOutlet var ButtonInCell4: UIButton!
    @IBOutlet var LabelInCell4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

