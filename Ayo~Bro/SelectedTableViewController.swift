//
//  TestTableViewController.swift
//  study-tableCell
//
//  Created by GW_19 on 25/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class SelectedTableViewController: UITableViewController {
    
    var selectedIndex:Int = 0
    
    let Array = [ "서울", "제주", "부산" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath)
        cell.textLabel?.text = Array[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        print(Array[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let vc = segue.destination as! SelectedDetailTableViewController
        
        //        vc.SelectedArray = Array[indexPath.row]
        vc.Region = Array[indexPath.row]
        
        //        segue.source               identifier 을 통해서 설정가능
        //        segue.destination
        //        segue.identifier
    }
    
}
