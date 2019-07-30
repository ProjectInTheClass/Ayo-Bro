//
//  DataViewController.swift
//  Ayo~Bro
//
//  Created by GW_14 on 30/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {


    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    var displayText: String?
    var displayDaySchedule: UIImage?

    var index: Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = displayText
        displayImage.image = displayDaySchedule
   

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
