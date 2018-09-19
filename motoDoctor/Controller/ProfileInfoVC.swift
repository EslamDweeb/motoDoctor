//
//  ProfileInfoVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/15/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class ProfileInfoVC: UIViewController {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var accountTyoeLbl: UILabel!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInfo()
    }

    @IBAction func settingBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let editeProfileVC = storyboard.instantiateViewController(withIdentifier: "EditeProfileVC") as! EditeProfileVC
        present(editeProfileVC, animated: true, completion: nil)
    }
    func setUserInfo() {
        userNameLbl.text = AuthService.instance.fullName
        phoneNumLbl.text = AuthService.instance.userName
        let fullName = AuthService.instance.fullName
        var fullNameArr = fullName.components(separatedBy: " ")
        firstNameLbl.text = fullNameArr[0]
        lastNameLbl.text = fullNameArr[1]
   }
}
