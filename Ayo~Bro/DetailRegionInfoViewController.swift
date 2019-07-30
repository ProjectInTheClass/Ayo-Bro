import UIKit
import Foundation

class DetailRegionInfoViewController: UIViewController {
    var infoRegion:RegionInfomation?
    
    @IBOutlet var labelRegion:UILabel? = nil
    @IBOutlet var labelExplain:UILabel? = nil
    @IBOutlet var viewImage:UIImageView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelRegion?.text = infoRegion?.region
        labelExplain?.text = infoRegion?.Explain
        viewImage?.image = infoRegion?.image
        
    }
}
