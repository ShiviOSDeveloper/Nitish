//
//  resultDataModel.swift
//  Flight
//
//  Created by Shiv on 16/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class resultDataModel: NSObject {
    var isFlights:String?
    var isWarnings:String?
    var isError:String?
    var fltSchedule = fltScheduleModel()
     var fareDetails = fareDetailsModel()
}
