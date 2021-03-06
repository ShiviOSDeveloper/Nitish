//
//  Login_VC.swift
//  Flight
//
//  Created by Little on 08/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class Login_VC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFldPwd: UITextField!
    @IBOutlet weak var txtFldUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPwd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.txtFldUserName.delegate = self
        self.txtFldPwd.delegate = self
        
        self.SetLeftSIDEImage(TextField: self.txtFldUserName, ImageName: "user_icon")
        self.SetLeftSIDEImage(TextField: self.txtFldPwd, ImageName: "password")
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: Any)
    {
        
        
        if (self.txtFldUserName.text?.isEmpty)!
        {
            self.alert(message: "Enter user name", title: "Oops")
        }
        else if(self.txtFldPwd.text?.isEmpty)!
        {
             self.alert(message: "Enter password", title: "Oops")
        }
        else
        {
            let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
            hud.label.text = "Loading"
            hud.mode = .annularDeterminate
            
            let strURL = baseUrl + loginUrl+"?" + "Email=\(txtFldUserName.text!)&password=\(txtFldPwd.text!)"
            let header = ["Content-Type":"application/json; charset=utf-8"]
            
            AFWrapper.requestPOSTURL(strURL, params: nil, headers: header, success:  {
                (JSONResponse) -> Void in
                
                
                print(JSONResponse)
                
                let dict = JSONResponse.dictionary
                print(dict?["Message"] ?? "")
                let msg = dict?["Message"] ?? ""
                
                if msg != ""
                {
                    self.alert(message: msg.string ?? "", title: "Sign In")

                }
                else
                {
                    myProfile.Name = dict?["USERNAME"]?.string
                    myProfile.Email = dict?["EMAIL"]?.string
                    myProfile.Password = self.txtFldPwd.text!
                    myProfile.CRATE_DATE = dict?["CRATE_DATE"]?.string
                    myProfile.Id = dict?["Id"]?.int
                    myProfile.isLogin = true
                    self.alert(message:"Sign In Successfully!", title: "Sign In")
                    
                    self.navigationController?.popToRootViewController(animated: true)

                }
               
               hud.hide(animated: true)
            }) {
                (error) -> Void in
                print(error)
                hud.hide(animated: true)

            }
        }
    }
    
    
    @IBAction func forgotPwd(_ sender: Any)
    {
    }
    
    @IBAction func BtnSignUp(_ sender: Any)
    {
        
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
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = UITextField.BorderStyle.none
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


// MARK: - Initializers

extension UIViewController {
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
        
    }
}
