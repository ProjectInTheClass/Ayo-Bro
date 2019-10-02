//
//  CourseEditTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 30/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData
var courseEditIndex = 0
class CourseEditTableViewController: UITableViewController {

    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let button = UIButton(type: .system)
        button.setTitle("편집 모드", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 242.0/255, green: 75.0/255, blue: 106.0/255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 18)
        return button
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ddcourseArray.count == 0 {
            return 0
        }
        return ddcourseArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.font =  UIFont(name: "NanumSquareRoundOTFB", size: 14)
        if ddcourseArray.count == 0 {
            cell.textLabel?.text = "저장된 정보가 없습니다."
            return cell
        }
        
        cell.textLabel?.text = ddcourseArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseEditIndex = indexPath.row
    }
    
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            guard let resultDetail = fetchCourseDetailData() else {
                return
            }
            for element in resultDetail{
                if (ddcourseArray[indexPath.row].courseArray[i].detail[)
            }
            if ddcourseArray[indexPath.row].courseArray.count > 0 {
                for i in 0 ... ddcourseArray[indexPath.row].courseArray.count - 1 {
                    if ddcourseArray[indexPath.row].courseArray[i].detail[i].courseID != nil {
                        let deleteDetailCourse = resultDetail[indexPath.row]
                        context?.delete(deleteDetailCourse)
                        guard save() else{
                            return
                        }
                        
                    }
                }
            }
            
            
            
            guard let resultCourse = fetchCourseData() else {
                return
            }
            let deleteCourse = resultCourse[indexPath.row]
            context?.delete(deleteCourse)
            guard save() else{
                return
            }
            
            ddcourseArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadData()
        }
    }
    func fetchCourseData() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CourseData")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }
    func fetchCourseDetailData() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CourseDetailData")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }
    
    func save() -> Bool {
        guard let context = self.context else{
            return false
        }
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("error : \(error)")
        }
        return false
    }
}
