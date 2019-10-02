//
//  schemeViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 13/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class schemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func kakao(_ sender: Any) {
        openApp(name: "kakaomap://route?sp=37.537229,127.005515&ep=37.4979502,127.0276368&by=PUBLICTRANSIT")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func openApp (name:String) {
        if let appUrl = URL(string: "\(name)://") {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
            } else {
                // app store 이동
                openURLToAppStore(urlPath: name)
            }
        }
    }
    func openURLToAppStore(urlPath : String){
        print("url = \(urlPath)")
        if let url = URL(string: urlPath),
            UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
