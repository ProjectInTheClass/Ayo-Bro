//
//  CourseMakeModalViewController.swift
//  Ayo~Bro
//
//  Created by 전정준 on 26/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import CoreData
//
//struct CourseInfo{
//    var siCode : Int
//    var gunguCode : Int
//    var selectedDay : Int
//    var courseTitle : String
//}

class CourseMakeModalViewController : UIViewController, UITextFieldDelegate{
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
    var bigAreaRow = 0
    var smallAreaRow: Int?
    var dayRow : Int?
    var currentIndex : Int = 0
//    var siCode : Int?
//    var gunguCode : Int?
   
    
    
    @IBOutlet weak var CourseName: UITextField!
    
    
    @IBOutlet weak var areaCode: UITextField!
    @IBOutlet weak var SigunguCode: UITextField!
   
    
    @IBOutlet weak var Day: UITextField!
    
    @IBAction func SigunguPicker(_ sender: Any) {
        createSigunguPicker()
        createAreaPicker()
        createToolbar()
    }
    
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
        createDayPicker()
        createSigunguPicker()
        createAreaPicker()
        createToolbar()
        CourseName.text = "제목 없음"
        CourseName.textColor = UIColor.gray
        CourseName.clearsOnBeginEditing = true
        Day.text = "당일 치기"
        Day.textColor = UIColor.gray
        SigunguCode.text = "서울특별시"
        SigunguCode.textColor = UIColor.gray
        areaCode.text = "강남구"
        areaCode.textColor = UIColor.gray
        CourseName.delegate = self
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
    func createSigunguPicker() {
        let sigunguPicker = UIPickerView()
        sigunguPicker.delegate = self
        sigunguPicker.tag = 1
        SigunguCode.inputView = sigunguPicker
    }
    func createAreaPicker() {
        let areaPicker = UIPickerView()
        areaPicker.delegate = self
        areaPicker.tag = 2
        areaCode.inputView = areaPicker
    }
        
        
    @IBAction func OKAction(_ sender: Any) {
        guard save() else{
            return
        }
        ddcourseArray.append(DddcourseArray(courseArray: [], title: CourseName.text ?? "제목 없음", regionName : "\(BigAreaArray![bigAreaRow].bigArea) \(BigAreaArray![bigAreaRow ].middleArea[(smallAreaRow ?? 0)+1])", currentIndex: ddcourseArray.count))

        var i = 0
        while i < (dayRow ?? 0) + 1{
            ddcourseArray[ddcourseArray.count-1].courseArray.append(CourseArray(detail: [], dayInfo: i+1))
            i += 1
        }
        dismiss(animated: true, completion: nil)
    }
    
    func fetch() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CourseData")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{

        }
        return nil
    }
    
    func save() -> Bool {
        guard let context = self.context else{
            return false
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "CourseData", in: context) else{
            return false
        }
        let courseData = NSManagedObject(entity: entity, insertInto: context)
        courseData.setValue(bigAreaRow, forKey: "areaCode")
        courseData.setValue((smallAreaRow ?? 0)+1, forKey:  "sigunguCode")
        courseData.setValue(dayRow ?? 0, forKey: "selectedDay")
        courseData.setValue(CourseName.text ?? "제목 없음", forKey: "courseTitle")
        courseData.setValue(currentIndex, forKey: "currentIndex")
        do {
            try context.save()
            return true
        } catch let error as NSError {

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
        
        SigunguCode.inputAccessoryView = toolBar
        Day.inputAccessoryView = toolBar
        areaCode.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension CourseMakeModalViewController : UIPickerViewDataSource, UIPickerViewDelegate {
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
        if (pickerView.tag == 0) {
            return days.count
        }
        else if(pickerView.tag == 1) {
            bigAreaRow = pickerView.selectedRow(inComponent: 0)
            return BigAreaArray!.count
        }
        else{
            return BigAreaArray![bigAreaRow].middleArea.count - 1
            }
        }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0){
            return days[row]
        }
            
        else if (pickerView.tag == 1){
            bigAreaRow = pickerView.selectedRow(inComponent: 0)
            return BigAreaArray![row].bigArea
        }
        else {
            
            return BigAreaArray![bigAreaRow].middleArea[row+1]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0){
            selectedDay = days[row]
            Day.text = selectedDay
            Day.textColor = UIColor.black
            dayRow = row
        }
        else if (pickerView.tag == 1){
            pickerView.reloadAllComponents()
            createAreaPicker()
            bigAreaRow = pickerView.selectedRow(inComponent: 0)
            siCode = BigAreaArray![bigAreaRow].bigArea
            let sigunguCode = BigAreaArray![bigAreaRow].middleArea[1]
            areaCode.text = sigunguCode
            areaCode.textColor = UIColor.black
            SigunguCode.text = siCode!
            SigunguCode.textColor = UIColor.black
        }
        else {
            pickerView.reloadAllComponents()
            smallAreaRow = pickerView.selectedRow(inComponent: 0)
            gunguCode = BigAreaArray![bigAreaRow].middleArea[smallAreaRow!+1]
            areaCode.text = gunguCode!
            areaCode.textColor = UIColor.black
        }
    }
}
