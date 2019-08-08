//
//  MyPlaceController.swift
//  Ayo~Bro
//
//  Created by A09 on 09/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

struct SectionData {
    var isOpended: Bool
    var title:String
    //    var cellData:[String]
}

class MyPlaceController: UITableViewController {
    
    var sectionDatas:[SectionData] = [
        SectionData(isOpended: false, title: "Title1"),
        SectionData(isOpended: false, title: "Title2"),
        SectionData(isOpended: false, title: "Title3"),
        SectionData(isOpended: false, title: "Title4")
    ]
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .white
        self.tableView.register(UINib(nibName: MyPlaceCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MyPlaceCell.reuseIdentifier)
    }

}

extension MyPlaceController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionDatas[section].isOpended {
            return 2
        }
        return 1
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionDatas.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = sectionDatas[indexPath.section].title
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyPlaceCell.reuseIdentifier, for: indexPath) as! MyPlaceCell
            cell.activityTableView?.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                cell.activityTableView?.alpha = 1
            }, completion: nil)
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 250
        }
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sectionDatas[indexPath.section].isOpended = sectionDatas[indexPath.section].isOpended ? false : true
            let sections = IndexSet(integer: indexPath.section)
            let menuIndexPath = IndexPath(row: 1, section: indexPath.section)
            if let cell = tableView.cellForRow(at: menuIndexPath) as? MyPlaceCell{ // is Menu Down?
                UIView.animate(withDuration: 0.3, animations: {
                    cell.activityTableView?.alpha = 0
                }) { (_) in
                    cell.activityTableView?.isHidden = true
                    tableView.reloadSections(sections, with: .none)
                }
            }else{ // Menu Should down
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
}

