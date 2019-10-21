//
//  HomeHomeCollectionViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 24/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
var homeContentId : Int?
var homeContentTypeId : Int?
class HHomeCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imgcell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath)
        
        let Image = imgcell.viewWithTag(2) as! UIImageView
        if (indexPath.row == 0){
           
            Image.image = UIImage(named: "p2")
        }
        else if(indexPath.row == 1){
            
            Image.image = UIImage(named: "p1")
        }
        else if(indexPath.row == 2){
            
            Image.image = UIImage(named: "p3")
        }
        else if(indexPath.row == 3){
            
            Image.image = UIImage(named: "p4")
        }
        else {
            
            Image.image = UIImage(named: "p5")
        }
        return imgcell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailInfoVC") as! DetailInfoViewController
        switch(indexPath.row){
        case 0:
            homeContentId = 128918
            homeContentTypeId = 12
            break
        case 1:
            homeContentId = 128168
            homeContentTypeId = 12
            break
        case 2:
            homeContentId = 128526
            homeContentTypeId = 12
            break
        case 3:
            homeContentId = 322836
            homeContentTypeId = 12
            break
        case 4:
            homeContentId = 126537
            homeContentTypeId = 12
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
        

    }
    
}
