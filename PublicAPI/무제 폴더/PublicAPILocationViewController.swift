//
//  PublicAPILocationViewController
//  Ayo~Bro
//
//  Created by GW_13 on 07/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class PublicAPILocationViewController : UIViewController {
    let queueSub = OperationQueue()
    let modelPublicLocationAPI = PublicAPILocationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "지역 코드"
        self.modelPublicLocationAPI.requestToServer()
    }
    
    
}

