//
//  CreateAccountVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController, Alertable {
    // Outlest
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var accountTypeTxt: RoundedTextField!
    @IBOutlet weak var confirmPasswordTxt: RoundedTextField!
    @IBOutlet weak var passwordTxt: RoundedTextField!
    @IBOutlet weak var phoneTxt: RoundedTextField!
    @IBOutlet weak var fullNameTxt: RoundedTextField!
    
    //Constats and Variables
    var list = ["Customer","WorkShop"]
    var userType: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        accountTypeTxt.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func cancleBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountWasPressed(_ sender: Any) {
        
        guard let fullName = fullNameTxt.text, fullNameTxt.text != "" else{return}
        guard let phoneNum = phoneTxt.text, phoneTxt.text != "" else{return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else{return}
        guard let confirmPassword = confirmPasswordTxt.text, confirmPasswordTxt.text != "" else{return}
        guard let accountType = accountTypeTxt.text, accountTypeTxt.text != "" else{return}
        if accountType == "Customer"{
            userType = "C"
        }else{
            userType = "W"
        }
        AuthService.instance.registerUser(fullName: fullName, phoneNum: phoneNum, userName: phoneNum, password: password, deviceType: deviceType, deviceID: deviceID!, confirmPassword: confirmPassword, userType: userType) { (success) in
            if success! {
                if password == confirmPassword {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let verificationVC = storyboard.instantiateViewController(withIdentifier: "VerificationVC")
                    self.present(verificationVC, animated: true, completion: nil)
                }else{
                    self.showAlert("there is an error in password plz try again")
                }
            }
        }
        
    }
}
//Extentions
extension CreateAccountVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.accountTypeTxt.text = self.list[row]
        self.pickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
}
extension CreateAccountVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.accountTypeTxt {
            self.pickerView.isHidden = false
            textField.endEditing(true)
        }
    }
}
