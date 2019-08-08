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
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
}

