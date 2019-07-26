//
//  DetailViewController.swift
//  Ayo~Bro
//
//  Created by GW_13 on 25/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import Foundation

class InfoTableViewController : UITableViewController{
    
    var selectedIndex:Int = 0
    var ListNotice:NoticeList?
    @IBOutlet var smallInfo:UILabel?
    @IBOutlet var bigInfo:UILabel?
    @IBOutlet var dateInfo:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        smallInfo?.text = ListNotice?.smallInfo
        bigInfo?.text = ListNotice?.bigInfo
        dateInfo?.text = ListNotice?.dateInfo
        // Do any additional setup after loading the view.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrUpdate.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpdateCell")! as! InfoTableViewCell
        
        cell.labelTop?.text = arrUpdate[indexPath.row].smallInfo
        cell.labelMid?.text = arrUpdate[indexPath.row].bigInfo
        cell.labelBottom?.text = arrUpdate[indexPath.row].dateInfo
        cell.detailTextLabel?.text = arrUpdate[indexPath.row].bigInfo
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let vc = segue.destination as! InfoDetailViewController
        
        vc.ListNotice = arrUpdate[indexPath.row]
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

