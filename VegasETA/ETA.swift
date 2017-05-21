//
//  ETA.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import UIKit
import SwiftMoment

class ETA: NSObject {
    let absoluteDate: Moment
    let name: String
    
    init(absoluteDate: Moment, name: String) {
        self.absoluteDate = absoluteDate
        self.name = name
    }
}
