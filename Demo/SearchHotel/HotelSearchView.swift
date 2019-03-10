//
//  HotelSearchView.swift
//  Flight
//
//  Created by Shiv on 09/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class HotelSearchView: UIView,UITextFieldDelegate {

    @IBOutlet weak var searchTxtFld: UITextField?
    @IBOutlet weak var checkinTxtFld: UITextField?
    @IBOutlet weak var checkOutTxtFld: UITextField?
    @IBOutlet weak var roomTxtFld: UITextField?
    @IBOutlet weak var guestTxtFld: UITextField?
    @IBOutlet weak var searchBtn: UIButton?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if roomTxtFld == textField || guestTxtFld == textField{
            let maxLength = 2
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
    }
    
    
}
