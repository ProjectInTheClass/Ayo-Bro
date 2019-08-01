//
//  InfoDetailViewController.swift
//  Ayo~Bro
//
//  Created by GW_13 on 26/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//
import UIKit
import Foundation

class NoticeInfoDetailViewController : UIViewController {
    
    var ListNotice:NoticeList?
    
    @IBOutlet var lableTitle:UILabel? = nil
    @IBOutlet var lableText:UILabel? = nil
    @IBOutlet var lableDate:UILabel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lableTitle?.text = ListNotice?.bigInfo
        lableText?.text = ListNotice?.textInfo
        lableDate?.text = ListNotice?.dateInfo
    }
}
