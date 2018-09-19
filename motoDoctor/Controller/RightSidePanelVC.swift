//
//  RightSidePanelVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/7/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class RightSidePanelVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: circleImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLbl.text = AuthService.instance.fullName
    }
   
    @IBAction func editeProfileBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let profileInfoVC = storyboard.instantiateViewController(withIdentifier: "ProfileInfoVC") as! ProfileInfoVC
        present(profileInfoVC, animated: true, completion: nil)
    }
}
