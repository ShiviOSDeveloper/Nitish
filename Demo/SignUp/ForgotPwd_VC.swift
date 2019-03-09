//
//  ForgotPwd_VC.swift
//  Flight
//
//  Created by Little on 09/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class ForgotPwd_VC: UIViewController {

    @IBOutlet weak var txtFldEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtFldEmail.setBottomBorder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any)
    {
        if (self.txtFldEmail.text?.isValidEmail())!
        {
            
        }
        else
        {
            self.alert(message: "Incorrect email id", title: "Oops")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
