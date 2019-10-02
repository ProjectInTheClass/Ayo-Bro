//
//  DetailCourseTableViewCell.swift
//  Ayo~Bro
//
//  Created by 최세린 on 13/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class DetailCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var CourseDiagraming: UIImageView!
    @IBOutlet weak var PlaceName: UILabel!
    @IBOutlet weak var TotalTime: UILabel!
    @IBOutlet weak var TotalWalkingTime: UILabel!
    @IBOutlet weak var startStation: UILabel!
    @IBOutlet weak var endStation: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var pathType: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
