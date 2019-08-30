//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/19/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit
import SideMenu



class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
      self.navigationController?.navigationBar.shadowImage = UIImage()
//    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9137254902, green: 0.1098039216, blue: 0.1019607843, alpha: 0.9358679367)

}

    @IBAction func loginButtonAction(_ sender: Any) {
        let parameter = ["email":usernameTextField.text!,"password":passwordTextField.text!]
       
        JsonParsing.callWebService(url: UrlEndPoints.login, httpMethod:.post, responceTYpe: Login.self, parameters: parameter as [String : Any], headers: nil) { response in
          if response.status == 200
          {
            Singleton.shared.userdata = response.data
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: vc)
            appDelegate.window?.makeKeyAndVisible()
            //self.navigationController?.pushViewController(vc, animated: true)
            
            
            }
            else
          {
            print(response.user_msg!)
            }
        }
        
        
        
    }
    
    
    @IBAction func pushToRegisterPage(_ sender: Any) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
}
