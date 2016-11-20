//
//  ETA.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import UIKit
import SwiftDate

class ETA: NSObject {
    let absoluteDate: DateInRegion
    let name: String
    
    init(absoluteDate: DateInRegion, name: String) {
        self.absoluteDate = absoluteDate
        self.name = name
    }
}
