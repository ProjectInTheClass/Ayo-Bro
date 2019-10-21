//
//  MyPlaceCell.swift
//  Ayo~Bro
//
//  Created by A09 on 09/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class MyPlaceCell: UITableViewCell {
    
    let storyboard = UIStoryboard.init(name: "MyPlace", bundle: nil)
    var activityTableViewController: HiddenController?
    var activityTableView: UITableView?
    
    func reloadTableView() {
        activityTableView?.reloadData()
    }
    
    fileprivate func setupCollectionView(){
        activityTableViewController = (storyboard.instantiateViewController(withIdentifier: "HiddenController") as! HiddenController)
        activityTableView = activityTableViewController?.tableView
        activityTableView?.reloadData()
        self.addSubview(activityTableView!)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
}
