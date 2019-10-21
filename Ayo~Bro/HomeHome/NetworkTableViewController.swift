//
//  NetworkTableViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 01/10/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//
import SystemConfiguration
import UIKit

class NetworkTableViewController: UITableViewController {

    override func viewDidAppear(_ animated: Bool) {
        
        if !CheckInternet.Connection(){
            
            self.Alert(Message: "데이터 네트워크 차단 상태입니다.\n연결 후 사용해주세요.")
            
        }
        
    }
    
    func Alert (Message: String){
        
        let alert = UIAlertController(title: "데이터 연결", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:  { result in DispatchQueue.main.asyncAfter(deadline: .now(), execute: { exit(0) })}))
            
        self.present(alert, animated: true, completion: nil)
        
        
    }
}
