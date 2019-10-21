//
//  PublicAPICategoryViewController.swift
//  Ayo~Bro
//
//  Created by GW_13 on 07/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class PublicAPICategoryViewController : UITableViewController {
    let queueSub = OperationQueue()
    let modelPublicCategoryAPI = PublicAPICategoryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "카테고리"
        self.modelPublicCategoryAPI.requestToServer()
    }
    
}
