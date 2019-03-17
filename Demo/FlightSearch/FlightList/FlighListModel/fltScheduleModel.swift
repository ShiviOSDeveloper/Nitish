//
//  fltScheduleModel.swift
//  Flight
//
//  Created by Shiv on 16/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class fltScheduleModel: NSObject {
    var scid:String?
    var flt_originDestination = [flt_originDestinationModel]()
}
class flt_originDestinationModel: NSObject {
    var ID:String?
    var OD = [ODModel]()
    var fareDetail_ID_originDestination = fareDetail_ID_originDestinationModel()
    
}
class ODModel: NSObject {
    var classtype:String?
    var tdu:String?
    var ts:String?
    var FS = [FSMODEL]()
}
class FSMODEL: NSObject {
    var aac:String?
    var dac:String?
    var dd:String?
    var ad:String?
    var ddt:String?
    var adt:String?
    var du:String?
    var ml:String?
    var classtype:String?
    
}

