//
//  VerificationVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class VerificationVC: UIViewController {

    @IBOutlet weak var verificationTxt3: RoundedTextField!
    @IBOutlet weak var verificationTxt2: RoundedTextField!
    @IBOutlet weak var verificationTxt0: RoundedTextField!
    @IBOutlet weak var verificationTxt1: RoundedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancleBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func confirmBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let verificationVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        present(verificationVC, animated: true, completion: nil)
    }
    
}
