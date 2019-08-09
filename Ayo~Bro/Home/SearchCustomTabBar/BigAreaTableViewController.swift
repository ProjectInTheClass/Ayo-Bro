//
//  BigAreaTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 08/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

var RRArray = [ "전국", "경기도", "경상남도", "경상북도", "강원도", "전라남도", "전라북도", "충청남도", "충청북도", "제주도"]

import UIKit
var selectRegionIndex = 0
class BigAreaTableViewController: UITableViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Cancell(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRegionIndex = indexPath.row
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return RRArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(RRArray[indexPath.row])"

        return cell
    }
    

}
