//
//  HotelSearchModel.swift
//  Flight
//
//  Created by Shiv on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class HotelSearchModel {
    
    var searchTitle:String!
    var checkIn:String!
    var checkOut:String!
  
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let myString = formatter.string(from:Date())
       checkIn = myString
       checkOut = myString
    }
}
