//
//  EditTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 29/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData

class EditTableViewController: UITableViewController {
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    @IBAction func editFinish(_ sender: Any) {
        guard let result = fetch() else {
            return
        }
        for element in result {
            if ddcourseArray[selectedCourseIndex].currentIndex == element.value(forKey: "courseId") as! Int {
                if (ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].dayInfo - 1) == element.value(forKey: "dayId") as! Int {
                    context?.delete(element)
                    
                }
            }
        }
        save()
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1 >= 0{
            for i in 0 ... ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1{
                saveCourseDetailData(i: i)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressCalled(_:)))
        tableView.addGestureRecognizer(longPressGesture)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count == 0 {
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
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count == 0 {
            return 0
        }
        return ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
            cell.textLabel?.text = "저장된 값이 없습니다."
            return cell
        }
        let checkButton = UIButton(type: .system)
        checkButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        checkButton.setImage(UIImage(named: "melonEdit"), for: .normal)
        cell.accessoryView = checkButton
        cell.accessoryView?.tintColor = .lightGray
        
        cell.textLabel?.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].title
        
        
        
        return cell
    }
    
    
    func snapshotOfCell (_ inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
        
    }
    
    @objc func longPressCalled(_ longPress: UILongPressGestureRecognizer) {
        print("longPressCalled")
        
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        
        struct My {
            static var cellSnapshot : UIView?
        }
        
        struct Path {
            static var initialIndexPath : IndexPath?
        }
        
        switch longPress.state {
            
        case UIGestureRecognizerState.began:
            print("began")
            
            guard let indexPath = indexPath else { return }
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            Path.initialIndexPath = indexPath
            My.cellSnapshot = snapshotOfCell(cell)
            
            var center = cell.center
            My.cellSnapshot!.center = center
            My.cellSnapshot!.alpha = 0.0
            tableView.addSubview(My.cellSnapshot!)
            
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                center.y = locationInView.y
                My.cellSnapshot!.center = center
                My.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                My.cellSnapshot!.alpha = 0.98
                cell.alpha = 0.0
            }, completion: { (finished) -> Void in
                if finished {
                    cell.isHidden = true
                }
            })
            
        case UIGestureRecognizerState.changed:
            
            var center = My.cellSnapshot!.center
            center.y = locationInView.y
            My.cellSnapshot!.center = center
            
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                
                //                swap(&testTest![indexPath!.section].locationArray[indexPath!.row], &testTest![indexPath!.section].locationArray[Path.initialIndexPath!.row])
                ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.swapAt(indexPath!.row, Path.initialIndexPath!.row)
                
                tableView.moveRow(at: Path.initialIndexPath!, to: indexPath!)
                Path.initialIndexPath = indexPath
            }
        default:
            
            guard let cell = tableView.cellForRow(at: Path.initialIndexPath!) else { return }
            cell.isHidden = false
            cell.alpha = 0.0
            
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                My.cellSnapshot!.center = cell.center
                My.cellSnapshot!.transform = CGAffineTransform.identity
                My.cellSnapshot!.alpha = 0.0
                cell.alpha = 1.0
            }, completion: { (finished) -> Void in
                if finished {
                    Path.initialIndexPath = nil
                    My.cellSnapshot!.removeFromSuperview()
                    My.cellSnapshot = nil
                }
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.remove(at: indexPath.row)
//            guard let result = fetch() else {
//                return
//            }
//            let element = result[indexPath.row]
//            context?.delete(element)
//            guard save() else{
//                return
//            }
            
            tableView.reloadData()
        }
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
    
    func saveCourseDetailData(i : Int) -> Bool {
        guard let context = self.context else{
            return false
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "CourseDetailData", in: context) else{
            return false
        }
        let courseData = NSManagedObject(entity: entity, insertInto: context)
        
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].dayInfo - 1, forKey: "dayId")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].title, forKey: "title")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].addr1, forKey: "addr1")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].area, forKey:  "areaCode")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].courseID, forKey: "courseId")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].mapx, forKey: "mapx")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].mapy, forKey: "mapy")
        courseData.setValue(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[i].sigungu, forKey: "sigunguCode")
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("error : \(error)")
        }
        return false
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
