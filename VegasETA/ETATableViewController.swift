//
//  ETATableViewController.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import UIKit
import SwiftMoment
import FormatterKit

class ETATableViewController: UITableViewController {

    var etas = [ETA]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        
        loadETAs()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  { timer in
            //self.loadETAs()
            if(self.tableView.isEditing) {
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func loadETAs() {
        let vegas = ETA(
            absoluteDate: moment() + 6.months,
            name: "Vegas")
        let pompa = ETA(
            absoluteDate: moment() + 6.months + 15.minutes,
            name: "BJ")
        let ibiza = ETA(
            absoluteDate: moment("2017-05-25")!,
            name: "Ibiza")
        etas = [vegas, pompa, ibiza]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return etas.count
    }

    @IBAction func unwindToETAList(segue: UIStoryboardSegue) {
        if let source = segue.source as? ChooseTargetViewController {
            let eta = source.eta
            let newIndexPath = IndexPath(row: etas.count, section: 0)
            etas.append(eta!)
            tableView.insertRows(at: [newIndexPath], with: UITableViewRowAnimation.bottom)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ETATableViewCell", for: indexPath) as! ETATableViewCell

        cell.etaNameLabel.text = etas[indexPath.row].name
        
        let dateB = etas[indexPath.row].absoluteDate
        
        let timeFormatter = TTTTimeIntervalFormatter()
        timeFormatter.usesIdiomaticDeicticExpressions = true
        let str3 = timeFormatter.stringForTimeInterval(from: Date(), to: dateB.date)
        
        cell.etaTimeLabel.text = str3
        // Configure the cell...
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            etas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
