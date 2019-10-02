//
//  DetailCourseTableViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 13/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData

struct DddcourseArray {
    var courseArray : Array<CourseArray>
    var title : String
    var regionName : String
    var currentIndex : Int
}

struct CourseArray {
    var detail : Array<DetailCourseArray>
    var dayInfo : Int
}

struct DetailCourseArray {
    var area : Int
    var sigungu : Int
    var mapx : Double
    var mapy : Double
    var title : String
    var courseID : Int
    var dayID : Int
    var addr1 : String

}

struct TransportationInfoArray{
    var pathType : Int
    var totalTime : Int
    var totalDistance : Int
    var firstStartStation : String
    var lastEndStation : String
}

var ddcourseArray : Array<DddcourseArray> = []
var transportationArray : Array<TransportationInfoArray> = []

class DetailCourseTableViewController: UITableViewController {
    //    var pathType : Int = 0
    //    var totalTime : Int = 0
    //    var totalDistance : Int = 0
    //    var firstStartStation : String = ""
    //    var lastEndStation : String = ""
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("selectedCourseIndex = " + "\(selectedCourseIndex)")
        print("currentViewControllerIndex = " + "\(currentViewControllerIndex)")
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count == 0 {
            return 1
        }
        return ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let temp : [String:Any] = [:]
        //        var result:[String:Any] = [:]
        
        
        if ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! DetailCourseTableViewCell
            cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
            cell.textLabel?.text = "저장된 값이 없습니다."
            cell.PlaceName.text = ""
            cell.address.text = ""
            cell.CourseDiagraming.image = UIImage(named: "noononnonono")
//            cell.TotalTime.text = ""
//            cell.TotalWalkingTime.text = ""
//            cell.CourseDiagraming.image = UIImage(named: "default")
//            cell.startStation.text = ""
//            cell.endStation.text = ""
//            cell.pathType.image = UIImage(named: "default")
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! DetailCourseTableViewCell
        cell.selectionStyle = .none
        if(indexPath.row == 0){
            cell.CourseDiagraming.image=UIImage(named:"1course")
            cell.PlaceName.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].title
            
            cell.address.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].addr1
            
        }
        else if(indexPath.row == (ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1)){
            cell.CourseDiagraming.image=UIImage(named: "3course")
            cell.PlaceName.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].title
            
            cell.address.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].addr1
            
        }// 코스만들때 장소갯수를 넣어주기.-1
        else if indexPath.row > (ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1) {
            return cell
        }
        else {
            cell.CourseDiagraming.image=UIImage(named: "2course")
            cell.PlaceName.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].title
            
            cell.address.text = ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].addr1
        }
        cell.textLabel?.text = ""
        
//        cell.address.text = ddcourse
        
        
        //                cell.TotalTime.text = "\(totalTime)분"
        //                cell.TotalWalkingTime.text = "\(totalWalk)m"
        //                cell.startStation.text = "출발역 : \(firstStartStation)"
        //                cell.endStation.text = "도착역 : \(lastEndStation)"
//        if indexPath.row != ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1 {
//
//            let lblApiKey : String = "4lxxDK1H2+9ggPtJcw2arw"              //발급받은 인증 키값 입력
//            ODsayService.sharedInst().setApiKey(lblApiKey)    //SDK 인증
//            ODsayService.sharedInst().setTimeout(10000)
//            ODsayService.sharedInst().requestSearchPubTransPath("\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].mapy)", sy: "\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].mapx)", ex: "\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row + 1].mapy)", ey: "\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row + 1].mapx)", opt: 0, searchType: 0, searchPathType: 0) {
//                (retCode:Int32, resultDic:[AnyHashable : Any]?) in
//                if retCode == 200 {
//                    let temp = resultDic as![String:Any]
//                    if let result = temp["result"] as? [String:Any]{
//
//                        let path = result["path"] as! NSArray
//                        let path0 = path[0] as! [String:Any]
//                        let info = path0["info"] as! [String:Any]
//                        self.pathType = path0["pathType"] as! Int
//                        self.totalTime = info["totalTime"] as! Int
//                        self.totalDistance = info["totalDistance"] as! Int
//                        self.firstStartStation = info["firstStartStation"] as! String
//                        self.lastEndStation = info["lastEndStation"] as! String
//                        transportationArray.append(TransportationInfoArray(pathType: self.pathType, totalTime: self.totalTime, totalDistance: self.totalDistance, firstStartStation: self.firstStartStation, lastEndStation: self.lastEndStation))
//                        let tD = self.totalDistance/1000
//                        cell.TotalTime.text = "\(self.totalTime)분"
//                        cell.TotalWalkingTime.text = "(\(tD) km"
//                        cell.startStation.text = "출발역 : \(self.firstStartStation)"
//                        cell.endStation.text = "도착역 : \(self.lastEndStation)"
//
//
//
//                        if( self.pathType == 0 ){
//                            cell.pathType.image = UIImage(named: "subway")
//                        }else if( self.pathType == 1){
//                            cell.pathType.image = UIImage(named: "bus")
//                        }else{
//                            cell.pathType.image = UIImage(named: "subus")
//                        }
//
//                    }
//
//                }
//            }
//
//
//        }
//        else {
//            cell.TotalTime.text = ""
//            cell.TotalWalkingTime.text = ""
//            cell.startStation.text = ""
//            cell.endStation.text = ""
//        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != (ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count - 1) && ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail.count != 0)
        {
            openApp(name: "kakaomap://route?sp=\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].mapx),\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row].mapy)&ep=\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row + 1].mapx),\(ddcourseArray[selectedCourseIndex].courseArray[coursecurrentIndex].detail[indexPath.row + 1].mapy)&by=PUBLICTRANSIT")
        }
    }
    
    func openApp (name:String) {
        if let appUrl = URL(string: "\(name)://") {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
            } else {
                // app store 이동
                openURLToAppStore(urlPath: name)
            }
        }
    }
    func openURLToAppStore(urlPath : String){
        print("url = \(urlPath)")
        if let url = URL(string: urlPath),
            UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    
    
//    func fetch() -> [NSManagedObject]? {
//        guard let context = self.context else {
//            return nil
//        }
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ODSay")
//        do {
//            return try context.fetch(fetchRequest)
//        } catch let error as NSError{
//            print("error : \(error)")
//        }
//        return nil
//    }
//    func saveODSay() -> Bool {
//        guard let context = self.context else{
//            return false
//        }
//        guard let entity = NSEntityDescription.entity(forEntityName: "ODSay", in: context) else{
//            return false
//        }
//        let courseData = NSManagedObject(entity: entity, insertInto: context)
//        courseData.setValue(firstStartStation, forKey: "firstStartStation")
//        courseData.setValue(lastEndStation, forKey: "lastEndStation")
//        courseData.setValue(pathType, forKey: "pathType")
//        courseData.setValue(totalDistance, forKey: "totalDistance")
//        courseData.setValue(totalTime,forKey: "totalTime")
//        courseData.setValue(contentId, forKey: "contentId")
//        do {
//            try context.save()
//            return true
//        } catch let error as NSError {
//            print("error : \(error)")
//        }
//        return true
//    }
}
