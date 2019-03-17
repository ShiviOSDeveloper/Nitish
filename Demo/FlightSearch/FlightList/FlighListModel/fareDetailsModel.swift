//
//  fareDetailsModel.swift
//  Flight
//
//  Created by Shiv on 16/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class fareDetailsModel: NSObject {
    var fareDetail_originDestination = fareDetail_originDestinationModel()
}
class fareDetail_originDestinationModel: NSObject {
    var ID:String?
    var fareDetail_ID_originDestination = fareDetail_ID_originDestinationModel()
}
class fareDetail_ID_originDestinationModel: NSObject {
    var OMod = OModel()
}
class OModel: NSObject {
    var ADTMod = ADTModel()
}
class RModel: NSObject {
    var ADTMod = ADTModel()
}
class ADTModel: NSObject {
    var tf:String?
    var bf:String?
}
