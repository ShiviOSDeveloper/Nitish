//
//  BusSearchModel.swift
//  Flight
//
//  Created by Shiv on 14/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class BusSearchModel {
    var origin:String!
    var destination:String!
    var departureDate:String!
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let myString = formatter.string(from:Date())
        departureDate = myString
    }
}
