//
//  ETATableViewCell.swift
//  LasVegasETA
//
//  Created by Michele Cantelli on 20/11/16.
//  Copyright © 2016 Michele Cantelli. All rights reserved.
//

import UIKit

class ETATableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var etaNameLabel: UILabel!
    @IBOutlet weak var etaTimeLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
