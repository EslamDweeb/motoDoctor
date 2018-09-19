//
//  ServiceTypeVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/10/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class ServiceTypeVC: UIViewController {
    var serviceType:[String] = []
    var delegate: WorkshopServiceDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func radioBtnWasPressed(_ sender: RadioButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            serviceType.append(sender.currentTitle!)
        }
    }
    @IBAction func cancleBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choseBtnWasPressed(_ sender: Any) {
        delegate?.workshopServiceType(seviceType: serviceType)
        dismiss(animated: true, completion: nil)
    }
}
