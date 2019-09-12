//
//  HomeRegionTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 08/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class HomeRegionTableViewController: UITableViewController {
    
//    var indexOfTab:Int = 0
    var selectedIndex = 0
    
    var items:[PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HomeTableViewCell
        let queueSub = OperationQueue()

        let item = items[indexPath.row]
        
        
        
        cell.regionLabel.text = item.title
        cell.regionLabel.numberOfLines = 3
        if let stringURL = item.firstimage2 {
            let url = URL(string: stringURL)!
            queueSub.addOperation {
                    let image = try! Data(contentsOf: url)
                
                OperationQueue.main.addOperation {
                    cell.regionImage.image = UIImage(data: image)
            }
        }
    }
//        switch indexRow {
//
//        case 0 :
//            cell.regionLabel.text = modelPublicAPI.resultCourse[indexPath.row].title
//        case 1 :
//            cell.regionLabel.text = modelPublicAPI.resultTripDestination[indexPath.row].title
//        case 2 :
//            cell.regionLabel.text = modelPublicAPI.resultFood[indexPath.row].title
//        case 3 :
//            cell.regionLabel.text = modelPublicAPI.resultLeports[indexPath.row].title
//        case 4 :
//            cell.regionLabel.text = modelPublicAPI.resultStay[indexPath.row].title
//        case 5 :
//            cell.regionLabel.text = modelPublicAPI.resultCulture[indexPath.row].title
//        default :
//            print ("Error")
//
//        }
//        cell.regionImage.image = UIImage(named: "loading")
        ///cell.regionLabel.text = modelPublicAPI.result[indexPath.row].title
        cell.explainLabel.text = item.addr1
        cell.explainLabel.numberOfLines = 4
        cell.selectButton.setImage(UIImage(named: "star"), for: .normal)
        //즐겨찾기
//        if let stringURL = modelPublicAPI.result[indexPath.row].firstimage2 {
//            let url = URL(string: stringURL)!
//            self.queueSub.addOperation {
//                let image = try! Data(contentsOf: url)
//
//                OperationQueue.main.addOperation {
//                    cell.regionImage.image = UIImage(data: image)
//                }
//            }
//        }
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let vc = segue.destination as! DetailInfoTableViewController
        
        vc.detailInfo = items[indexPath.row]
    }
    
}



