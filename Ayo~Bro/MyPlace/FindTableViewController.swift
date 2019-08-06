//
//  FindTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 31/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {

    var selectedIndex:Int = 0
    
    @IBOutlet var resultRegionValue: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if regionRegion.selectedIndex < 0 {
            resultRegionValue.titleLabel?.text = "전국"
        }
        else {
            resultRegionValue.titleLabel?.text = regionRegion.RegionInformation[regionRegion.selectedIndex].region
        }
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if regionRegion.selectedIndex < 0 {
            return regionRegion.RegionInformation.count
        }
        else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info:RegionInfomation
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell") as! RightImageTableViewCell
        
        if regionRegion.selectedIndex < 0 {
            info = regionRegion.RegionInformation[indexPath.row]
        }
        else {
            info = regionRegion.RegionInformation[regionRegion.selectedIndex]
        }

        cell.labelRegion?.text = info.region
        cell.labelExplain?.text = info.Explain
        cell.viewImage?.image = info.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        segue.source
        //        segue.identifier
        if segue.identifier == "SegueToDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let vc = segue.destination as! DetailRegionInfoViewController
            
            vc.infoRegion = regionRegion.RegionInformation[indexPath.row]
        }
        
    }
}
