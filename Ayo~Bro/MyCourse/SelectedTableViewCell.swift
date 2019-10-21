//
//  SelectedTableViewCell.swift
//  Ayo~Bro
//
//  Created by A09 on 02/10/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class SelectedTableViewCell: UITableViewCell {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
