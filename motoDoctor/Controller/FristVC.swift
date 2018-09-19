//
//  ViewController.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/2/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
//import CoreLocation

class FristVC: UIViewController {
    var delegate: CenterVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC, animated: true, completion: nil)
    }
    
}


