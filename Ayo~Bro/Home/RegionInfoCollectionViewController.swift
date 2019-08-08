import UIKit
import Foundation

class RegionInfoCollectionViewController : UICollectionViewController {
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regionRegion.RegionInformation.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let info = regionRegion.RegionInformation[indexPath.row]
        
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
        
        vc.infoRegion = regionRegion.RegionInformation[indexPath.row]
        
    }
    
}
