//
//  HotelSearchModel.swift
//  Flight
//
//  Created by Shiv on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class FlightSearchModel {
    
    var departure:String!
    var destination:String!
    var departureDate:String!
    var returnDate:String!
    var traveller:String!
    var travellerClass:String!
    var ac_departure:String!
    var ac_destination:String!

    var AirFrom_autoSuggestModel = AirautoSuggestModel()
    var AirTo_autoSuggestModel = AirautoSuggestModel()
    
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let myString = formatter.string(from:Date())
       departureDate = myString
       returnDate = myString
    }
}
