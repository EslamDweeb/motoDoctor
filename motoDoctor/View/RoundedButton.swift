//
//  RoundedButton.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/2/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius = 5.0
    }
}
