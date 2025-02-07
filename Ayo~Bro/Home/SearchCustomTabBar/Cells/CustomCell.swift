//
//  CustomCell.swift
//  CustomTabBar
//
//  Created by 이동건 on 2018. 4. 18..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var label: UILabel = {
 ///       let labelText:[String]=["담은장소","담은코스","만든코스"]
        let label = UILabel()
        label.text = "Tab"
        label.textAlignment = .center
        label.font = UIFont(name: "NanumSquareRoundOTFB", size: 20)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
//            let Modelapi = PublicAPIModel()
//            Modelapi.requestToServer()

            self.label.textColor = isSelected ? .black : .lightGray
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
