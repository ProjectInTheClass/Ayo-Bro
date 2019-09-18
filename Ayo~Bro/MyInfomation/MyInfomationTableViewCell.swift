//
//  MyInfomationTableViewCell.swift
//  Ayo~Bro
//
//  Created by 전정준 on 18/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation

class MyInfomationViewCell : UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var changeImageButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
