//
//  DetailTestTableViewController.swift
//  study-tableCell
//
//  Created by GW_19 on 25/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import Foundation

class SelectedDetailTableViewController: UITableViewController {
    
    //    @IBOutlet var lableCity:UILabel? = nil
    //    @IBOutlet var lableNation:UILabel? = nil
    //    @IBOutlet var viewImage:UIImageView? = nil
    var SelectedArray:Array<String>?
    @IBOutlet var Region:String? = nil
    
    let DetailArray = [ "서울" : ["1일차","서울여행지1","서울여행지2","서울여행지3",
                                    "2일차","서울여행지4","서울여행지5","서울여행지6",
                                    "3일차","서울여행지7","서울여행지8","서울여행지9"],
                        "제주" : ["1일차","제주여행지1","제주여행지2","제주여행지3",
                                    "2일차","제주여행지4","제주여행지5","제주여행지6",
                                    "3일차","제주여행지7","제주여행지8","제주여행지9"],
                        "부산" : ["1일차","여행지1","여행지2","여행지3",
                                    "2일차","여행지4","여행지5","여행지6",
                                    "3일차","여행지7","여행지8","여행지9"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return seoulEntireSchedule.schedules.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return seoulEntireSchedule.schedules[section].dayInfo
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.blue
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return seoulEntireSchedule.schedules[section].destinations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath)
        let daySchedules:Array<ScheduleByDay>
        if Region == "서울" {
            daySchedules = seoulEntireSchedule.schedules
        }
        else if Region == "제주" {
            daySchedules = jejuEntireSchedule.schedules
        }
        else if Region == "부산"{
            daySchedules = busanEntireSchedule.schedules
        }
        else{
            daySchedules = [ seoul_Day1, seoul_Day2, seoul_Day3 ]
        }
        let daySchedule = daySchedules[indexPath.section]
        cell.textLabel?.text = daySchedule.destinations[indexPath.row]
        return cell
    }
    
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
