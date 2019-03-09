//
//  SignUP_VC.swift
//  Flight
//
//  Created by Little on 09/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class SignUP_VC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var txtConfirmPwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.SetLeftSIDEImage(TextField: self.txtUserName, ImageName: "user_icon")
        self.SetLeftSIDEImage(TextField: self.txtEmail, ImageName: "email_icon")
        self.SetLeftSIDEImage(TextField: self.txtPwd, ImageName: "password")
        self.SetLeftSIDEImage(TextField: self.txtConfirmPwd, ImageName: "password")
        self.txtUserName.delegate = self
        self.txtEmail.delegate = self
        self.txtPwd.delegate = self
        self.txtConfirmPwd.delegate = self
      
    }
    
    @IBAction func btnSignUp(_ sender: Any)
    {
        if(self.txtUserName.text?.isEmpty)!
        {
           
            self.alert(message: "Enter user name", title: "oops")
        }
        else
        {
            if ((self.txtEmail.text?.isValidEmail())!)
            {
                 self.alert(message: "Enter valid email id ", title: "oops")
            }
                
          else if(self.txtPwd.text?.isEmpty)!
          {
                self.alert(message: "Enter passowrd", title: "oops")
          }
            else if(self.txtPwd.text!==self.txtConfirmPwd.text!)
            {
                self.alert(message: "password do not match", title: "oops")
            }
            else
            {
                //here webservice
            }
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

    func SetLeftSIDEImage(TextField: UITextField, ImageName: String){
        
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        
        let leftView = UIView()
        
        leftView.frame = CGRect(x: 5, y: 0, width: 30, height: 20)
        leftImageView.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
        TextField.leftViewMode = .always
        TextField.leftView = leftView
        
        let image = UIImage(named: ImageName)?.withRenderingMode(.alwaysTemplate)
        leftImageView.image = image
        leftImageView.tintColor = UIColor.white
        leftImageView.tintColorDidChange()
        
        leftView.addSubview(leftImageView)
    }

    
    
    func animateTextField(textField: UITextField, up: Bool)
    {
        let movementDistance:CGFloat = -130
        let movementDuration: Double = 0.3
        
        var movement:CGFloat = 0
        if up
        {
            movement = movementDistance
        }
        else
        {
            movement = -movementDistance
        }
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.animateTextField(textField: textField, up:true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.animateTextField(textField: textField, up:false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

    

    

