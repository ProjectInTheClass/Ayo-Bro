//
//  HomeHomeCollectionViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 24/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class HomeHomeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let viewImage = cell.viewWithTag(1) as! UIImageView
        
        if (indexPath.row == 0){
            viewImage.image = UIImage(named: "f1")
        }
        else if(indexPath.row == 1){
            viewImage.image = UIImage(named: "f2")
            
        }
        else if(indexPath.row == 2){
            viewImage.image = UIImage(named: "f3")
            
        }
        else if(indexPath.row == 3){
            viewImage.image = UIImage(named: "f4")
            
        }
        else {
            viewImage.image = UIImage(named: "f5")
            
        }
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailInfoVC") as! DetailInfoViewController
        switch (indexPath.row){
        case 0:
            homeContentId = 579046
            homeContentTypeId = 39
            break
        case 1:
            homeContentId = 1019491
            homeContentTypeId = 39
            break
        case 2:
            homeContentId = 133246
            homeContentTypeId = 39
            break
        case 3:
            homeContentId = 1014486
            homeContentTypeId = 39
            break
        case 4:
            homeContentId = 1019409
            homeContentTypeId = 39
            break
        default :
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
