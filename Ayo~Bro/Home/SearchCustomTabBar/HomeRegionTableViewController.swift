//
//  HomeRegionTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 08/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData

struct BookmarkArray {
    var regionName : String
    var isExpanded : Bool
    var locationArray : Array<String> = ["저장된 즐겨찾기가 없습니다!"]
}

class HomeRegionTableViewController: UITableViewController {
    let itemsPerBatch = 20
    var numOfPage = 0
    var offset = 0
    var reachedEndOfItems = false
    var indexOfMenu:Int = 0 {
        didSet {
            self.procUpdateDataWithUI()
        }
    }
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    var selectedIndex = 0
    var nc:UINavigationController?
    var Title : String?
    var contentId : Int?
    var areaCode : Int?
    var sigunguCode : Int?
    var mapx : Double?
    var mapy : Double?
    var firstimage2: String?
    var addr1 : String = ""
    var contentTypeId: Int?
    var totalCount : [PublicAPIResponse.HeaderWithBody.Body.Item] = []
    var items:[PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("NOTI_SEARCH_DIDSELECT") , object: nil, queue: OperationQueue.main) { (noti) in
            self.procUpdateDataWithUI()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "reload"), object: nil)
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    
    func procUpdateDataWithUI() {
        items = sharedModelPublicAPI.itemsForIndex(index: indexOfMenu)

        tableView.contentOffset = CGPoint(x:0, y:0 - tableView.contentInset.top)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.procUpdateDataWithUI()
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count == 0{
            return 1
        }
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HomeTableViewCell
        let queueSub = OperationQueue()
        
        if items.count == 0 {
            cell.textLabel?.text = "해당 카테고리에는 데이터가 없습니다!!"
            cell.regionLabel.text = ""
            cell.explainLabel.text = ""
            cell.regionImage.image = UIImage(named: "nonono")
            tableView.allowsSelection = false
            let starButton = UIButton(type: .system)
            starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            starButton.setImage(UIImage(named: "no"), for: .normal)
            cell.accessoryView = starButton
            
            return cell
        }
        tableView.allowsSelection = true
        let item = items[indexPath.row]
        cell.textLabel?.text = ""
        cell.regionLabel.text = item.title
        cell.regionLabel.numberOfLines = 3
        
        if let stringURL = item.firstimage2 {
            let url = URL(string: stringURL)!
            queueSub.addOperation {
                if let image = try? Data(contentsOf: url){
                    OperationQueue.main.addOperation {
                        cell.regionImage.image = UIImage(data: image)
                    }
                }
                else {
                    cell.regionImage.image = UIImage(named: "defaultImage")
                }
                
            }
        }
        else {
            cell.regionImage.image = UIImage(named: "defaultImage")
        }
        
        cell.explainLabel.text = item.addr1
        cell.explainLabel.numberOfLines = 4
        let starButton = UIButton(type: .system)
        starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        starButton.setImage(UIImage(named: "fav_star"), for: .normal)
        starButton.addTarget(self, action: #selector(HomeRegionTableViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        starButton.tag = indexPath.row
        cell.accessoryView = starButton
        cell.accessoryView?.tintColor = sharedBookMark[items[indexPath.row].contentid] != nil ? .yellow : .lightGray
        return cell
        
    }
    
    @objc func accessoryButtonTapped(sender : UIButton){
        
        var tempBig : Int
        if items[sender.tag].areacode == 1 { // 서울
            tempBig = 0
        }
        else if items[sender.tag].areacode == 2 {/// 인천
            tempBig = 1
        }
        else if items[sender.tag].areacode == 3 { /// 대전
            tempBig = 2
        }
        else if items[sender.tag].areacode == 4 { /// 대구
            tempBig = 3
        }
        else if items[sender.tag].areacode == 5 { /// 광주
            tempBig = 4
        }
        else if items[sender.tag].areacode == 6 { /// 부산
            tempBig = 5
        }
        else if items[sender.tag].areacode == 7 { /// 울산
            tempBig = 6
        }
        else if items[sender.tag].areacode == 32 { // 강원도
            tempBig = 7
        }
        else if items[sender.tag].areacode == 31 { // 경기도
            tempBig = 8
        }
        else if items[sender.tag].areacode == 36 { // 경상남도
            tempBig = 9
        }
        else if items[sender.tag].areacode == 35 { // 경상북도
            tempBig = 10
        }
        else if items[sender.tag].areacode == 38 { // 전라남도
            tempBig = 11
        }
        else if items[sender.tag].areacode == 37 { // 전라북도
            tempBig = 12
        }
        else if items[sender.tag].areacode == 34 { // 충청남도
            tempBig = 13
        }
        else if items[sender.tag].areacode == 33 { // 충청북도
            tempBig = 14
        }
        else if items[sender.tag].areacode == 39 { // 제주도
            tempBig = 15
        }
        else {
            tempBig = -1
        }
        Title = items[sender.tag].title
        let contentID = items[sender.tag].contentid
        contentId = items[sender.tag].contentid
        areaCode = tempBig
        sigunguCode = items[sender.tag].sigungucode
        mapx = items[sender.tag].mapx
        mapy = items[sender.tag].mapy
        firstimage2 = items[sender.tag].firstimage2
        addr1 = items[sender.tag].addr1!
        contentTypeId = items[sender.tag].contenttypeid
        let regionName = "\(BigAreaArray![tempBig].bigArea) \(BigAreaArray![tempBig].middleArea[sigunguCode!])"
        
        
        if sharedBookMark[contentID] == nil {
            // 신규 체크~
            sharedBookMark[contentID] = contentID
            var i = 0
            while ( i < trueBookmarkArray.count ) {
                if trueBookmarkArray[i].regionName == regionName {
                    trueBookmarkArray[i].middleArray.append(locationArray(title: Title!, contentid: contentID, contenttypeid: contentTypeId!, image: firstimage2, mapx: mapx!, mapy: mapy!, sigungucode: sigunguCode!, areacode: tempBig, addr1: addr1))
                    break
                }
                i += 1
            }
            if i == trueBookmarkArray.count {
                trueBookmarkArray.append(realBookmarkArray(regionName: regionName, isExpanded: true, middleArray: [locationArray(title: Title!, contentid: contentID, contenttypeid: contentTypeId!, image: firstimage2, mapx: mapx!, mapy: mapy!, sigungucode: sigunguCode!, areacode: tempBig, addr1: addr1)]))
            }
            guard save() else{
                return
            }
            
        }
        else {
            // 북마크 제거다~
            sharedBookMark[contentID] = nil
            var i = 0
            var j = 0
            
            while true {
                if trueBookmarkArray[i].regionName == regionName {
                    break
                }
                i += 1
            }
            
            while true {
                if trueBookmarkArray[i].middleArray[j].contentid == contentID {
                    break
                }
                j += 1
            }
            
            trueBookmarkArray[i].middleArray.remove(at: j)
            
            if trueBookmarkArray[i].middleArray.count == 0 {
                trueBookmarkArray.remove(at: i)
            }
            guard let result = fetch() else {
                return
            }
            for element in result {
                if (contentID == element.value(forKey: "contentId") as! Int){
                    context?.delete(element)
                    break
                }
            }
            guard save() else{
                return
            }
            
        }
        
        //        UserDefaults.standard.set(items[sender.tag].bookmark, forKey: "bookMarkState")
        sender.tintColor = sharedBookMark[items[sender.tag].contentid] != nil ? .yellow : .lightGray
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailInfoVC") as! DetailInfoViewController
        
        originData = items[indexPath.row]
        homeContentTypeId = items[indexPath.row].contenttypeid
        homeContentId = items[indexPath.row].contentid
        
        self.nc?.pushViewController(vc, animated: true)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if (maximumOffset - currentOffset <= 10.0) {
            numOfPage = numOfPage + 1
            loadMore()
        }
    }
    
    func loadMore() {
        guard !self.reachedEndOfItems else{
            return
        }
        
        DispatchQueue.main.async{
            var thisBatchOfItmes: [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside]? = []
            
            do{
                thisBatchOfItmes = sharedModelPublicAPI.requestForMoreData(numOfPage: self.numOfPage, index: self.indexOfMenu)
            }
            DispatchQueue.main.async {
                if let newItems : [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = thisBatchOfItmes {
                    self.items.append(contentsOf: newItems)
                    
                    self.tableView.reloadData()
                    if newItems.count < self.itemsPerBatch {
                        self.reachedEndOfItems = true

                    }
                    
                    self.offset += self.itemsPerBatch
                }
                
            }
        }
    }
    func fetch() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SelectLocation")
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
        guard let entity = NSEntityDescription.entity(forEntityName: "SelectLocation", in: context) else{
            return false
        }
        let courseData = NSManagedObject(entity: entity, insertInto: context)
        courseData.setValue(Title, forKey: "title")
        courseData.setValue(contentId, forKey:  "contentId")
        courseData.setValue(areaCode, forKey: "areaCode")
        courseData.setValue(sigunguCode, forKey: "sigunguCode")
        courseData.setValue(mapx, forKey: "mapx")
        courseData.setValue(mapy, forKey: "mapy")
        courseData.setValue(firstimage2, forKey:"firstImage2")
        courseData.setValue(contentTypeId, forKey: "contentTypeId")
        courseData.setValue(addr1, forKey: "addr1")
        do {
            try context.save()
            return true
        } catch let error as NSError {

        }
        return false
    }
    
    //    func setState(){
    //        let userDefualts = UserDefaults.standard
    //        if let bookMark = userDefualts.value(forKey: Setting.)
    //    }
    //}
    
}
