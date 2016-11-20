//
//  ChooseTargetViewController.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import Foundation
import UIKit
import SwiftDate

public class ChooseTargetViewController : UIViewController {
    @IBOutlet weak var etaPicker: UIDatePicker!
    
    @IBOutlet weak var etaNameLabel: UITextField!
    @IBOutlet weak var saveETA: UIBarButtonItem!
    
    var eta: ETA?
    
    override public func viewWillAppear(_ animated: Bool) {
    
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        eta = ETA(absoluteDate: DateInRegion(absoluteDate: etaPicker.date), name: etaNameLabel.text!)
    }
}
