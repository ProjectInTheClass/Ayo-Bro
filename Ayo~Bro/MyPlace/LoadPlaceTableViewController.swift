//
//  LoadPlaceTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 21/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import CoreData

class LoadPlaceTableViewController: UITableViewController {
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            guard let result = fetch() else {
                return
            }
            
            for element in result {
                if (trueBookmarkArray[indexPath.section].middleArray[indexPath.row].contentid == element.value(forKey: "contentId") as! Int){
                    context?.delete(element)
                    break
                }
            }
            save()
            sharedBookMark[trueBookmarkArray[indexPath.section].middleArray[indexPath.row].contentid] = nil
            trueBookmarkArray[indexPath.section].middleArray.remove(at: indexPath.row)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
            
            if trueBookmarkArray[indexPath.section].middleArray.count == 0 {
                trueBookmarkArray.remove(at: indexPath.section)
            }
            
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if trueBookmarkArray.count == 0 {
            return 1
        }
        return trueBookmarkArray.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if trueBookmarkArray.count == 0 {
            let button = UIButton(type: .system)
            button.setTitle("저장된 값이 없습니다.", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.lightGray
            button.titleLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
            
            return button
        }
        
        let button = UIButton(type: .system)
        button.setTitle(trueBookmarkArray[section].regionName, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 244.0/255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in trueBookmarkArray[section].middleArray.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = trueBookmarkArray[section].isExpanded
        trueBookmarkArray[section].isExpanded = !isExpanded
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if trueBookmarkArray.count == 0 {
            return 0
        }
        if !trueBookmarkArray[section].isExpanded {
            return 0
        }
        return trueBookmarkArray[section].middleArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailInfoVC") as! DetailInfoViewController
        homeContentId = trueBookmarkArray[indexPath.section].middleArray[indexPath.row].contentid
        homeContentTypeId = trueBookmarkArray[indexPath.section].middleArray[indexPath.row].contenttypeid
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! LoadPlaceTableViewCell
        if trueBookmarkArray.count == 0 {
            return cell
        }
        let queueSub = OperationQueue()
        
        let contact = trueBookmarkArray[indexPath.section].middleArray[indexPath.row].title
        let bookmarkImage = trueBookmarkArray[indexPath.section].middleArray[indexPath.row].image
        
        if let stringURL = bookmarkImage {
            let url = URL(string: stringURL)!
            queueSub.addOperation {
                if let image = try? Data(contentsOf: url){
                    OperationQueue.main.addOperation {
                        cell.bookmarkImage.image = UIImage(data: image)
                    }
                }
                else {
                    cell.bookmarkImage.image = UIImage(named: "defaultImage")
                }
            }
        }
        else {
            cell.bookmarkImage.image = UIImage(named: "defaultImage")
        }
        cell.bookmarkLabel.text = contact
        
        return cell
    }
    func fetch() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SelectLocation")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }
    func save() -> Bool {
        do {
            try context?.save()
            return true
        } catch let error as NSError {
            print("error : \(error)")
        }
        return false
    }
    
}
