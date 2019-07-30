struct RegionInfomation {
    let region:String
    let Explain:String
    let image:UIImage?
}

let regionRegion:Array<RegionInfomation> = [RegionInfomation(region: "서울", Explain: "서울에는 서울사람이 많다.", image: UIImage(named: "seoul")),
                                            RegionInfomation(region: "제주", Explain: "제주도 사람들은 섬사람이다.", image: UIImage(named: "jeju")),
                                            RegionInfomation(region: "부산", Explain: "부산은 대체로 부산스러운 편이다.", image: UIImage(named: "busan"))]

import UIKit
import Foundation

class RegionInfoCollectionViewController : UICollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regionRegion.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let info = regionRegion[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1",
                                                      for: indexPath)
        
        let viewImage = cell.viewWithTag(1) as! UIImageView
        let labelTop = cell.viewWithTag(2) as! UILabel
        let labelBottom = cell.viewWithTag(3) as! UILabel
        
        viewImage.image = info.image
        labelTop.text = info.region
        labelBottom.text = info.Explain
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        segue.source
        //        segue.identifier
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let vc = segue.destination as! DetailRegionInfoViewController
        
        vc.infoRegion = regionRegion[indexPath.row]
        
    }
    
}
