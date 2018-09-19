//
//  CarTypeVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/10/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class CarTypeVC: UIViewController {
    
    var carType:[String] = []
    var delegate: WorkshopServiceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func radioBtnWasPressed(_ sender: RadioButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            carType.append(sender.currentTitle!)
        }
    }
    
    @IBAction func choseBtnWasPressed(_ sender: Any) {
        delegate?.carType(carType: carType)
        dismiss(animated: true, completion: nil)
    }
}
