//
//  RegisterViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/19/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var femaleChkButton: UIButton!
    @IBOutlet weak var maleChkButton: UIButton!
    var malebutton:Bool = true
    var femaleButton:Bool = false
    var gender :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func maleRadioButton(_ sender: Any) {
       if malebutton
       {
        maleChkButton.setImage(#imageLiteral(resourceName: "chkn"), for: .normal)
        malebutton = false
        }
       else{
        femaleChkButton.setImage(#imageLiteral(resourceName: "chkn"), for: .normal)
        femaleButton = false
         maleChkButton.setImage(#imageLiteral(resourceName: "chky"), for: .normal)
        malebutton = true
        }
    }
    
    @IBAction func femaleRadioButton(_ sender: Any) {
        if femaleButton
        {
            femaleChkButton.setImage(#imageLiteral(resourceName: "chkn"), for: .normal)
            femaleButton = false
        }
        else{
            maleChkButton.setImage(#imageLiteral(resourceName: "chkn"), for: .normal)
            femaleChkButton.setImage(#imageLiteral(resourceName: "chky"), for: .normal)
            femaleButton = true
            malebutton = false
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if femaleButton {
            gender = "F"
        }
        else{
            gender = "M"
        }
        let registerData:[String:Any] = ["first_name":firstNameTextField.text!, "last_name":lastNameTextField.text!,"email":emailTextField.text!,"password":passwordTextField.text!,"confirm_password":conformPasswordTextField.text!,"gender":gender!, "phone_no": phoneTextField.text!]
            JsonParsing.callWebService(url:UrlEndPoints.register, httpMethod: .post, responceTYpe: Register.self, parameters: registerData, headers: nil) { data in
            
                }
          
      
        
       
        
        
    }
}
