//
//  PublicAPITableViewController.swift
//  Ayo~Bro
//
//  Created by Abraham Park on 8/7/19.
//  Copyright © 2019 GW_19. All rights reserved.
//
import UIKit
import Foundation

class PublicAPITableViewController : UITableViewController {
    let queueSub = OperationQueue()
    let modelPublicAPI = PublicAPIModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //queueSub.maxConcurrentOperationCount = 1 // 0 이면 동작 안함.. 각 숫자는 최대 동작 갯수 지정.
        
        self.title = "공공 정보"
        self.modelPublicAPI.requestToServer()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelPublicAPI.result.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
        
        cell.textLabel?.text = modelPublicAPI.result[indexPath.row].title
        cell.imageView?.image = UIImage(named: "loading")
        
        if let stringURL = modelPublicAPI.result[indexPath.row].firstimage2 {
            let url = URL(string: stringURL)!
            self.queueSub.addOperation {
                let image = try! Data(contentsOf: url)
                
                OperationQueue.main.addOperation {
                    cell.imageView?.image = UIImage(data: image)
                }
            }
        }
        return cell
    }
    
}
