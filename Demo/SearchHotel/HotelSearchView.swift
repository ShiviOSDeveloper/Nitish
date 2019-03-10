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
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        searchTxtFld?.setBlueBorder()
        checkinTxtFld?.setBlueBorder()
        checkOutTxtFld?.setBlueBorder()
        guestTxtFld?.setBlueBorder()
        roomTxtFld?.setBlueBorder()
    }
 
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

extension UITextField {
    func setBlueBorder() {
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.init(red: 188/255, green: 212/255, blue: 235/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
}
