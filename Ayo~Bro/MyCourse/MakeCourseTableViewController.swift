//
//  MakeCourseTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 25/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//
import CoreData
import UIKit
var testTag = -1
var aaa :Array<Bool> = []
class MakeCourseTableViewController: UITableViewController {
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    var addr1 : String = ""
    var area : Int = 0
    var sigungu : Int = 0
    var mapx : Double = 0
    var mapy : Double = 0
    var Title : String = ""
    var firstImage2 : String = ""
    var courseId : Int = 0
    var dayId : Int = 0
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Make(_ sender: Any) {
        var i = 0
        while i < aaa.count {
            
            if aaa[i] {
                ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.append(DetailCourseArray(area: trueBookmarkArray[testTag].middleArray[i].areacode, sigungu: trueBookmarkArray[testTag].middleArray[i].sigungucode, mapx: trueBookmarkArray[testTag].middleArray[i].mapy, mapy: trueBookmarkArray[testTag].middleArray[i].mapx, title: trueBookmarkArray[testTag].middleArray[i].title, courseID: ddcourseArray[selectedCourseIndex].currentIndex, dayID: ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].dayInfo, addr1: trueBookmarkArray[testTag].middleArray[i].addr1!))
                Title = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].title
                mapx = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].mapx
                mapy = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].mapy
                area = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].area
                sigungu = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].sigungu
                courseId = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].courseID
                dayId = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].dayInfo
                addr1 = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].addr1
                saveCourseDetail()
            }
            i += 1
        }
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var i = 0
        while ( i < trueBookmarkArray.count ){
            print(trueBookmarkArray[i].regionName)
            print(ddcourseArray[selectedCourseIndex].regionName)
            if ddcourseArray[selectedCourseIndex].regionName == trueBookmarkArray[i].regionName {
                testTag = i
                break;
            }
            i += 1
        }
        
        if i == trueBookmarkArray.count {
            testTag = -1
        }

        if aaa.count != 0 {
            aaa.removeAll()
        }
        var j = 0
        if testTag != -1 {
            while ( j < trueBookmarkArray[i].middleArray.count ) {
                aaa.append(false)
                j += 1
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if testTag == -1 {
            return 1
        }
        return trueBookmarkArray[testTag].middleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 15)
        if testTag == -1 {
            cell.textLabel?.text = "저장된 지역이 없습니다."
            return cell
        }
        //        print(testTag)
        cell.accessoryType = .checkmark
        cell.accessoryView?.tintColor = .lightGray
        
        let checkButton = UIButton(type: .system)
        checkButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        checkButton.setImage(UIImage(named: "check_mark"), for: .normal)
        checkButton.addTarget(self, action: #selector(MakeCourseTableViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        checkButton.tag = indexPath.row
        cell.accessoryView = checkButton
        cell.accessoryView?.tintColor = .lightGray
        cell.textLabel?.text = trueBookmarkArray[testTag].middleArray[indexPath.row].title
        
        return cell
    }
    

    @objc func accessoryButtonTapped(sender : UIButton){
        
        if aaa[sender.tag] {
            aaa[sender.tag] = false
        }
        else {
            aaa[sender.tag] = true
        }
        sender.tintColor = aaa[sender.tag] ? .blue : .lightGray
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if testTag != -1 {
            if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
                accessoryButtonTapped(sender: cell.accessoryView as! UIButton)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func fetch() -> [NSManagedObject]? {
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
    func saveCourseDetail() -> Bool {
        guard let context = self.context else{
            return false
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "CourseDetailData", in: context) else{
            return false
        }
        let courseData = NSManagedObject(entity: entity, insertInto: context)
        courseData.setValue(mapx, forKey: "mapx")
        courseData.setValue(mapy, forKey: "mapy")
        courseData.setValue(Title,forKey: "title")
        courseData.setValue(addr1, forKey: "addr1")
        courseData.setValue(area, forKey: "areaCode")
        courseData.setValue(sigungu, forKey: "sigunguCode")
        courseData.setValue(dayId-1, forKey: "dayId")
        courseData.setValue(courseId, forKey: "courseId")
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("error : \(error)")
        }
        return true
    }
}
