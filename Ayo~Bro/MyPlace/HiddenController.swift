//
//  HiddenController.swift
//  Ayo~Bro
//
//  Created by A09 on 09/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
var dummyArray = [ "여행지1", "야행지2", "여행지3", "여행지4", "여행지5", "여행지6"]
class HiddenController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPerssCalled(_:)))

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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dummyArray.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            dummyArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if RegionSection == 0 {
            cell.textLabel?.text = "여행지\(indexPath.row + 1)"
        }
        else if RegionSection == 1 {
            cell.textLabel?.text = "여행지\(indexPath.row + 1)"
        }
        else if RegionSection == 2 {
            cell.textLabel?.text = "여행지\(indexPath.row + 1)"
        }
        else if RegionSection == 3 {
            cell.textLabel?.text = "여행지\(indexPath.row + 1)"
        }
        
        
        
        
        return cell
    }

}
