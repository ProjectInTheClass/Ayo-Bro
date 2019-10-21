//
//  RealHomeHomeViewController.swift
//  Ayo~Bro
//
//  Created by 전정준 on 24/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class RealHomeHomeViewController : UIViewController{
    @IBOutlet var RealHomeHomeView: UITableView!
    
}

extension RealHomeHomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : RealHomeHomeTableViewCell
        if (indexPath.row == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeHomeCell1") as! RealHomeHomeTableViewCell
        }
        else if(indexPath.row == 1){
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeHomeCell2") as! RealHomeHomeTableViewCell
        }
        else if(indexPath.row == 2){
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeHomeCell3") as! RealHomeHomeTableViewCell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeHomeCell4") as! RealHomeHomeTableViewCell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
