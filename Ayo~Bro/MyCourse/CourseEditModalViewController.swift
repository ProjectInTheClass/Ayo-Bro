//
//  CourseEditModalViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 30/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData

class CourseEditModalViewController: UIViewController, UITextFieldDelegate {
    var acode = 0
    var scode = 0
    var currentIndex = ddcourseArray.count
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var x = 0
        var i = 0
        var j = 0
        while i < BigAreaArray!.count {
            while j < BigAreaArray![i].middleArea.count {
                if "\(BigAreaArray![i].bigArea) \(BigAreaArray![i].middleArea[j])" == ddcourseArray[courseEditIndex].regionName {
                    acode = i
                    scode = j - 1
                    x = -1
                    break
                }
                j += 1
                if x == -1 {
                    break
                }
            }
            i += 1
        }
        createDayPicker()
        createToolbar()
        CourseName.text = "\(ddcourseArray[courseEditIndex].title)"
        CourseName.textColor = UIColor.gray
        CourseName.clearsOnBeginEditing = true
        Day.text = "\(days[ddcourseArray[courseEditIndex].courseArray[coursecurrentIndex].dayInfo - 1])"
        Day.textColor = UIColor.gray
        CourseName.delegate = self
    }
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    let days = ["당일 치기", "1박 2일", "2박 3일", "3박 4일", "4박 5일","5박 6일", "6박 7일", "7박 8일", "8박 9일"]
    var courseName: String?
    var selectedDay : String?
    var siCode : String?
    var gunguCode : String?
    var bigAreaRow : Int?
    var smallAreaRow: Int?
    var dayRow : Int?
    //    var siCode : Int?
    //    var gunguCode : Int?
    @IBOutlet var CourseName: UITextField!
    @IBOutlet var Day: UITextField!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        CourseName.textColor = UIColor.black
        self.view.endEditing(true)
    }
    @IBAction func CourseNameColor(_ sender: Any) {
        CourseName.textColor = UIColor.black
    }
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CourseName.textColor = UIColor.black
        textField.resignFirstResponder()
        return true
    }
    func createDayPicker() {
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        dayPicker.tag = 0
        Day.inputView = dayPicker
    }
    @IBAction func Dismiss(_ sender: Any) {
        ddcourseArray[courseEditIndex].title = CourseName.text ?? "\(ddcourseArray[courseEditIndex].title)"
        guard let resultDetail = fetchCourseDetailData() else{
            return
        }
        var i = 0
        if (dayRow ?? ddcourseArray[courseEditIndex].courseArray.count - 2) + 1 > ddcourseArray[courseEditIndex].courseArray.count {
            i = ddcourseArray[courseEditIndex].courseArray.count
            while i < (dayRow ?? ddcourseArray[courseEditIndex].courseArray.count - 2) + 1 {
                ddcourseArray[courseEditIndex].courseArray.append(CourseArray(detail: [], dayInfo: i))
                i += 1
            }
        }
        else if (dayRow ?? ddcourseArray[courseEditIndex].courseArray.count - 2) + 1 < ddcourseArray[courseEditIndex].courseArray.count {
            i = ddcourseArray[courseEditIndex].courseArray.count - 1
            
            for element in resultDetail {
                if ddcourseArray[courseEditIndex].currentIndex == element.value(forKey: "courseId") as! Int {
                    if (ddcourseArray[selectedCourseIndex].courseArray[i].dayInfo - 1) == element.value(forKey: "dayId") as! Int {
                        context?.delete(element)
                    }
                }
            }
            guard save() else{
                return
            }
            while i > (dayRow ?? ddcourseArray[courseEditIndex].courseArray.count - 1) {
                
                ddcourseArray[courseEditIndex].courseArray.remove(at: i)
                i -= 1
            }
        }
        guard let result = fetch() else {
            return
        }
        let element = result[courseEditIndex]
        element.setValuesForKeys(["selectedDay" : dayRow ?? 0])
        element.setValuesForKeys(["courseTitle" : CourseName.text ?? "제목 없음"])
        element.setValuesForKeys(["currentIndex" : courseEditIndex])

        guard save() else{
            return
        }
        dismiss(animated: true, completion: nil)
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
    
    func fetch() -> [NSManagedObject]? {
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
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(CourseMakeModalViewController.dismissKeyboard))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        Day.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension CourseEditModalViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        Day.text = selectedDay
        Day.textColor = UIColor.black
        dayRow = row
    }
}
