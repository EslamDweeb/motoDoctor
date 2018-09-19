//
//  Alertable.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/4/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import Foundation
import UIKit

protocol Alertable {}

extension Alertable where Self: UIViewController {
    func showAlert(_ msg: String) {
        let alertController = UIAlertController(title: "Error:", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
