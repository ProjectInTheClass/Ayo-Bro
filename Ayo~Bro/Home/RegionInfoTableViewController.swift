
import UIKit
import Foundation

class RegionInfoTableViewController: UITableViewController{
    
    var selectedIndex:Int = 0
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionRegion.RegionInformation.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = regionRegion.RegionInformation[indexPath.row]
        
        let identi = "BigCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identi)! as! RightImageTableViewCell
        
        cell.labelRegion?.text = info.region
        cell.labelExplain?.text = info.Explain
        cell.viewImage?.image = info.image

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        //        print(arrayLocation[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        segue.source
        //        segue.identifier
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let vc = segue.destination as! DetailRegionInfoViewController
        
        vc.infoRegion = regionRegion.RegionInformation[indexPath.row]
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
