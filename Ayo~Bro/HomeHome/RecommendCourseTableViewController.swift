//
//  RecommendCourseTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 02/10/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit


class RecommendCourseTableViewController: UITableViewController {
    
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

        return recommnedArray[recommendIndex].recommend[recommendcurrent].detail.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! DetailCourseTableViewCell
        
        if(indexPath.row == 0){
            cell.CourseDiagraming.image=UIImage(named:"1course")
            cell.PlaceName.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].title
            cell.address.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].addr1
        }
        else if(indexPath.row == (recommnedArray[recommendIndex].recommend[recommendcurrent].detail.count - 1)){
            cell.CourseDiagraming.image=UIImage(named: "3course")
            cell.PlaceName.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].title
            cell.address.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].addr1
        }
        else if indexPath.row > (recommnedArray[recommendIndex].recommend[recommendcurrent].detail.count - 1) {
            return cell
        }
        else {
            cell.CourseDiagraming.image=UIImage(named: "2course")
            cell.PlaceName.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].title
            
            cell.address.text = recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].addr1
        }

        
        
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if(indexPath.row != (recommnedArray[recommendIndex].recommend[recommendcurrent].detail.count - 1) && recommnedArray[recommendIndex].recommend[recommendcurrent].detail.count != 0)
//        {
//            openApp(name: "kakaomap://route?sp=\(recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].mapx),\(recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row].mapy)&ep=\(recommnedArray[recommendIndex].recommend[recommendcurrent].detail[indexPath.row + 1].mapx),\(recommnedArray[recommendIndex].recommend[recommendIndex].detail[indexPath.row + 1].mapy)&by=PUBLICTRANSIT")
//        }
//    }
    
    func openApp (name:String) {
        if let appUrl = URL(string: "\(name)://") {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
            } else {
                openURLToAppStore(urlPath: name)
            }
        }
    }
    func openURLToAppStore(urlPath : String){

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

}
