//
//  PageCell.swift
//  CustomTabBar
//
//  Created by 이동건 on 2018. 4. 20..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {

    let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
    var activityTableViewController: HomeRegionTableViewController?
    var activityTableView: UITableView?
    
    func reloadTableView() {
        activityTableView?.reloadData()
    }
    
    fileprivate func setupCollectionView(){
        activityTableViewController = (storyboard.instantiateViewController(withIdentifier: "HomeRegionTableViewController") as! HomeRegionTableViewController)
        activityTableView = activityTableViewController?.tableView
        activityTableView?.reloadData()
        
        self.addSubview(activityTableView!)
        
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.backgroundColor = .red
//
//        self.addSubview(view)

        activityTableView?.translatesAutoresizingMaskIntoConstraints = false
        
        let ascArtH = "H:|-(0)-[tV]-(0)-|"
        let ascArtV = "V:|-(0)-[tV]-(0)-|"

        let arrayH = NSLayoutConstraint.constraints(withVisualFormat: ascArtH, options: .alignmentMask, metrics: nil, views: ["tV":activityTableView!])
        let arrayV = NSLayoutConstraint.constraints(withVisualFormat: ascArtV, options: .alignmentMask, metrics: nil, views: ["tV":activityTableView!])

        self.addConstraints(arrayH)
        self.addConstraints(arrayV)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
}

