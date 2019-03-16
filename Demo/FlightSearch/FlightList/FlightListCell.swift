//
//  FlightListCell.swift
//  Flight
//
//  Created by Shiv on 16/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class FlightListCell: UITableViewCell {
    @IBOutlet weak var dTime: UILabel!
    
    @IBOutlet weak var travellTime: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var aTime: UILabel!
    @IBOutlet weak var classType: UILabel!
    @IBOutlet weak var mealType: UILabel!
    @IBOutlet weak var stops: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
