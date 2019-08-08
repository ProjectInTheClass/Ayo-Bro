//
//  HomeRegionTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 07/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class HomeRegionTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HomeRegionTableViewCell
        
        cell.regionImage.image = UIImage(named: "star (2)")
        cell.regionLabel.text = "busan"
        cell.explainLabel.text = "Loem ipsum"
        cell.selectButton.setImage(UIImage(named: "star (2)"), for: .normal)
        return cell
    }
    
    
}
