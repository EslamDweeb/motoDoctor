//
//  MaintenaceServiceVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/7/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class MaintenaceServiceVC: UIViewController {
    var delegate: CenterVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func menuBtnWasPressed(_ sender: Any) {
        delegate?.toggleRightPanel()
    }
    
    @IBAction func searchForMovingWorkshopBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func searchForWorkshopBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let workshopVC = storyboard.instantiateViewController(withIdentifier: "WorkshopSearchVC")
        present(workshopVC, animated: true, completion: nil)
    }
}


