//
//  DetailInfoTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 05/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import Foundation

class DetailInfoTableViewController: UITableViewController {
    var originData : PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside?
    var detailInfo: [PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside] = []
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var justExplainLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var justAdressLabel: UILabel!
    
    
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        let contentId = originData?.contentid
        detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId!)
        let detailData = detailInfo[0]
        super.viewDidLoad()
        titleLabel.text = detailData.title
        let explain = detailData.overview?.components(separatedBy: ["<","b","r","\\","n",">"]).joined() /// 문자열 쪼개고 합치기
        explainLabel.text = explain
        if(detailData.contenttypeid != 25){
            justAdressLabel.text = "주소 : "
            addressLabel.text = detailData.addr1
        }
        let queueSub = OperationQueue()
        
        if let stringURL = detailData.firstimage {
            let url = URL(string: stringURL)!
            queueSub.addOperation {
                let image = try! Data(contentsOf: url)
                
                OperationQueue.main.addOperation {
                    self.Image.image = UIImage(data: image)
                }
            }
        }
    }
}
