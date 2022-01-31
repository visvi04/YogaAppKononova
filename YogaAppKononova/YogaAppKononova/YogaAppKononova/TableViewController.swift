//
//  TableViewController.swift
//  YogaAppKononova
//
//  Created by Student on 17.01.2022.
//

import UIKit
import WatchConnectivity

class TableViewController: UITableViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
     
    struct lessions {
        var name: String
        var time: TimeInterval
        var image: String
        
        static func getLessions() -> [lessions] {
            return [
                lessions(name: "Журавль", time: 15.0, image: "poza1"),
                lessions(name: "Лотус", time: 13.0, image: "poza1")
            ]
        }
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {}
        
    func sessionDidDeactivate(_ session: WCSession) {
    }
    var wcSession: WCSession! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lessions.getLessions().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowTable", for: indexPath) as! TableViewCell        
        cell.picture.image = UIImage(named: lessions.getLessions()[indexPath.row].image)
        cell.title.text = lessions.getLessions()[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = lessions.getLessions()[indexPath.row].name
        let time = lessions.getLessions()[indexPath.row].time
        do {
            let message = ["name": name, "time": time] as [String : Any]
            try wcSession.updateApplicationContext(message)
        } catch {
            print(error.localizedDescription)
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
