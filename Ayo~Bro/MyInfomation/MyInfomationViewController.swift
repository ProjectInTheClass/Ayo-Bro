//
//  MyInfomationTableViewController.swift
//  Ayo~Bro
//
//  Created by 전정준 on 18/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class MyInfomationViewController : UIViewController {

    var labelarr1: [String] = ["닉네임", "로그인 계정"]
    var labelarr2: [String] = ["건의사항","어플리케이션 정보"," 공지사항",]
//    lazy var imageView: UIImageView = {
//        let height : CGFloat = 220
//        let width : CGFloat = self.view.bounds.width / 2
//        let posX : CGFloat = (self.view.bounds.width - width)/2
//        let posY : CGFloat = (250 - height)/2
//
//        let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
//        let myImage: UIImage = UIImage(named: "Image")!
//
//        imageView.image = myImage
//
//        return imageView
//    }()
    
    @IBOutlet weak var MyInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
extension MyInfomationViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 30
        }
        else{
            let height : CGFloat = self.view.bounds.height - 540
            return height
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return 3
        }
        else{
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if (section == 0){
//            let view = UIView()
//            view.addSubview(self.imageView)
//
//            return view
//        }
//
//        else{
//            return nil
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoTableViewCell1", for: indexPath) as! MyInfomationViewCell
        
        if (indexPath.section == 0){
            cell.textLabel?.text = labelarr2[indexPath.row]
        }
        return cell
    }
    
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //            let cell : UITableViewCell = sender as! NoticeInfoTableViewCell
    //            let index : IndexPath = (MyInfoTableView.indexPath(for: cell))!
    //            let nextViewController: NoticeInfoTableViewController = segue.destination as! NoticeInfoTableViewController
    //            nextViewController.index = index
    //        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.section == 0){
            switch(indexPath.row){
            case 0:
                let alertController = UIAlertController(title: "건의사항", message: "\n건의사항 : 아래 메일로 문의주세요 ! \n\n E-mail : csl602@naver.com", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alertController.addAction(okAction)
                self.present(alertController,animated: true,completion: nil)
                break
                
            case 1:
                let alertController = UIAlertController(title: "어플리케이션 정보", message: "\n버전 : 1.0\n 개발팀 : 행님 ( 김진구, 전정준, 최세린 ) \n 최종 업데이트 : 2019.10.02", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alertController.addAction(okAction)
                self.present(alertController,animated: true,completion: nil)
                break
            case 2:
                performSegue(withIdentifier: "noticeInfo", sender: nil)
                break
            default:
                return
                
            }
        }
    }
}
