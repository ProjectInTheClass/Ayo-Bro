//
//  TestTableViewController.swift
//  study-tableCell
//
//  Created by GW_19 on 25/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData


var selectedCourseIndex = 0

struct course {
    var category : Int
    var orginalRow : Int
    var regionName : String
}


struct TestCourse {
    var regionName : String
    var locationArray : Array<String>
}

var courseTestArray : Array<String>? = ["없음"]


class SelectedTableViewController: UITableViewController {
    
    var selectedIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coursecurrentIndex = 0
        currentViewControllerIndex = 0
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if ddcourseArray.count == 0 {
            let button = UIButton(type: .system)
            button.setTitle("저장된 값이 없습니다.", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.lightGray
            button.titleLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
            return button
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ddcourseArray.count == 0 {
            return 0
        }
        return ddcourseArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! SelectedTableViewCell
        cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        if ddcourseArray.count == 0 {
            cell.textLabel?.text = "저장된 정보가 없습니다."
            cell.topLabel.text = ""
            cell.bottomLabel.text = ""
            return cell
        }
        cell.topLabel.text = ddcourseArray[indexPath.row].title
        cell.bottomLabel.text = "\(ddcourseArray[indexPath.row].regionName)"
        cell.textLabel?.text = ""
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        selectedCourseIndex = indexPath.row
    }
    
}
