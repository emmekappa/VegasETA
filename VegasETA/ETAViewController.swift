//
//  ETAViewController.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import Foundation
import UIKit

public class ETAViewController : UIViewController {
    @IBOutlet weak var etaDateLabel: UILabel!
    
    override public func viewWillAppear(_ animated: Bool) {
        let etaDate = UserDefaults.standard.object(forKey: "eta") as! Date
        
        let dateB = etaDate
        let dateC = Date()
        
        //let str3 = try! dateC.timeComponents(toDate: dateB, options: ComponentsFormatterOptions(style: .full, zero: .dropAll))
        
        etaDateLabel.text = "hi"
        
        /*
        let diff = Calendar.current.dateComponents([Calendar.Component.hour], from: Date(), to: etaDate)
        let hours = diff.hour!
        let days = (hours + 1) / 24
        etaDateLabel.text = "\(hours)hours / (\(days)days)"
 */
    }
}
