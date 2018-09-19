//
//  LoginVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/2/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTxt: RoundedTextField!
    @IBOutlet weak var userNameTxt: RoundedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginBtnWasPressed(_ sender: Any) {
        guard let userName = userNameTxt.text, userNameTxt.text != "" else{return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.loginUser(userName: userName, Password: password, token: deviceID!) { (success) in
            if success == true {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let maintenanceVC = storyboard.instantiateViewController(withIdentifier: "MaintenaceServiceVC") as! MaintenaceServiceVC
                self.present(maintenanceVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func createAccountWasPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "CreateAccountVC")
        present(loginVC, animated: true, completion: nil)
    }
}
