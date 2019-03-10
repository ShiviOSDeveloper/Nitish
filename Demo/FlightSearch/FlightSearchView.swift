//
//  FlightSearchView.swift
//  Flight
//
//  Created by Shiv on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit


    class FlightSearchView: UIView,UITextFieldDelegate {
        
        @IBOutlet weak var departureTxtFld: UITextField?
        @IBOutlet weak var destinationTxtFld: UITextField?
        @IBOutlet weak var departureDateTxtFld: UITextField?
        @IBOutlet weak var returnDateTxtFld: UITextField?
        @IBOutlet weak var travellerTxtFld: UITextField?
        @IBOutlet weak var classTxtFld: UITextField?

        @IBOutlet weak var searchBtn: UIButton?
        
        // Only override draw() if you perform custom drawing.
        // An empty implementation adversely affects performance during animation.
        override func draw(_ rect: CGRect) {
            // Drawing code
            departureTxtFld?.setBlueBorder()
            destinationTxtFld?.setBlueBorder()
            departureDateTxtFld?.setBlueBorder()
            returnDateTxtFld?.setBlueBorder()
            travellerTxtFld?.setBlueBorder()
            classTxtFld?.setBlueBorder()

        }
        
        
        
}
