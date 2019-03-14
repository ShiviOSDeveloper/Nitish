//
//  MyProfile.swift
//  Flight
//
//  Created by Shiv on 12/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class MyProfile
{
    var Name:String!
    var Email:String!
    var Password:String!
    var CRATE_DATE:String?
    var Id: Int?
    
    var isLogin:Bool!
    
    init() {
        if (UserDefaults.standard.bool(forKey: "isLogin") )
        {
            Name = UserDefaults.standard.value(forKey: "Name") as? String
            Email = UserDefaults.standard.value(forKey: "Email") as? String
            Password = UserDefaults.standard.value(forKey: "Password") as? String
        }
        else
        {
            Name = ""
            Email = ""
            Password = ""
        }
    }
}
