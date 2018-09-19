//
//  WorkshopSearchVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/9/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import CoreLocation

class WorkshopSearchVC: UIViewController, WorkshopServiceDelegate {
    var serviceType:[String] = []
    var carType:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    func workshopServiceType(seviceType: [String]) {
        self.serviceType = seviceType
    }
    
    func carType(carType: [String]) {
        self.carType = carType
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func serviceTypeBtnWasPressed(_
        sender: Any) {
        presentServiceTypeData()
    }
    
    @IBAction func carTypeBtnWasPressed(_ sender: Any) {
        presentCarTypeData()
    }
    
    @IBAction func showWorkshopBtnWasPressed(_ sender: Any) {
        print("serviceType: \(serviceType), carType: \(carType)")
    }
    func presentServiceTypeData() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let serviceTypeVC = storyboard.instantiateViewController(withIdentifier: "ServiceTypeVC") as! ServiceTypeVC
        present(serviceTypeVC, animated: true, completion: nil)
        serviceTypeVC.delegate = self
    }
    func presentCarTypeData() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let carTypeVC = storyboard.instantiateViewController(withIdentifier: "CarTypeVC") as! CarTypeVC
        present(carTypeVC, animated: true, completion: nil)
        carTypeVC.delegate = self
    }
}

