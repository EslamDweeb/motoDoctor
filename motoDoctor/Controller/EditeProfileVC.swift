//
//  EditeProfileVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/15/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import CoreLocation

class EditeProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userTypetxt: UITextField!
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var profileImage: circleImageView!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var phoneNumTxt: UITextField!
    
    var tap = UITapGestureRecognizer()
    let imagePickerViewController = UIImagePickerController()
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInfo()
        imagePickerViewController.delegate = self
        setupDelegateAndClearButtonMode()
        
        tap = UITapGestureRecognizer(target: self, action: #selector(editeProfileImage))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        profileImage.addGestureRecognizer(tap)
        profileImage.isUserInteractionEnabled = true
    }
    func setupUserInfo() {
        phoneNumTxt.text = AuthService.instance.userName
        let fullName = AuthService.instance.fullName
        var fullNameArr = fullName.components(separatedBy: " ")
        firstNameTxt.text = fullNameArr[0]
        lastNameTxt.text = fullNameArr[1]
        if AuthService.instance.userType == "C" {
            userTypetxt.text = "أشخاص"
        }else {
            userTypetxt.text = "ورشة"
        }
    }
    
    @objc func editeProfileImage() {
        
        let actionSheet = UIAlertController(title: "PhotoSource", message: "Choose your photo", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePickerViewController.sourceType = .camera
                self.present(self.imagePickerViewController, animated: true, completion: nil)
            }else{
                print("Camera not avaliable")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            self.imagePickerViewController.sourceType = .photoLibrary
            self.present(self.imagePickerViewController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func setupDelegateAndClearButtonMode() {
        firstNameTxt.delegate = self
        lastNameTxt.delegate = self
        phoneNumTxt.delegate = self
        
        firstNameTxt.clearButtonMode = UITextFieldViewMode.whileEditing
        lastNameTxt.clearButtonMode = UITextFieldViewMode.whileEditing
        phoneNumTxt.clearButtonMode = UITextFieldViewMode.whileEditing
    }
    @IBAction func saveBtnWasPressed(_ sender: Any) {
        AuthService.instance.updateUserInfo(id: 0, firstNameAr: firstNameTxt.text!, firstNameEn: firstNameTxt.text!, lastNameAr: lastNameTxt.text!, lastNameEn: lastNameTxt.text!, mobile: phoneNumTxt.text!, countryID: nil, cityID: nil, districtID: nil, longitude:(manager.location?.coordinate.longitude.description)!, latitude: String(describing: manager.location?.coordinate.latitude), userID: AuthService.instance.id, isActive: AuthService.instance.isActive) { (success) in
            if success! {
               self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func cancelBntWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension EditeProfileVC: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


