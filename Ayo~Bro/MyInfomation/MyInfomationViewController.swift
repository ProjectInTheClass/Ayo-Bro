//
//  MyInfomationTableViewController.swift
//  Ayo~Bro
//
//  Created by 전정준 on 18/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class MyInfomationViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    var labelarr1: [String] = ["닉네임", "로그인 계정"]
    var labelarr2: [String] = ["건의사항","어플리케이션 정보"," 공지사항",]
    @IBOutlet weak var MyInfoTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    @IBAction func selectAction(_ sender: Any) {
        let alert = UIAlertController(title: "어디서 사진을 가져올까", message: "사진을 가져와랏 !", preferredStyle:  .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in self.openLibrary()
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) {
            (action) in self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion : nil)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
}
    
    extension MyInfomationViewController : UITableViewDelegate, UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            if (section == 0 || section == 1){
                return 30
            }
            else{
                return 0
            }
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if (indexPath.section == 0){
                return 300
            }
            else{
                return 60 /// 기본 크기 값 ?
            }
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if (section == 0){
                return 1
            }
            else if (section == 1){
                return 2
            }
            else {
                return 3
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoTableViewCell1", for: indexPath) as! MyInfomationViewCell
            
            if (indexPath.section == 0){
                let camera : UIImage = UIImage(named:"camera")!
                cell.userImage.image = UIImage(named: "Image")
                cell.changeImageButton.setImage(camera, for: .normal)
            }
            else if (indexPath.section == 1){
                cell.textLabel?.text = labelarr1[indexPath.row]
            }
            else if (indexPath.section == 2){
                cell.textLabel?.text = labelarr2[indexPath.row]
            }
            
            
            return cell
        }
}
