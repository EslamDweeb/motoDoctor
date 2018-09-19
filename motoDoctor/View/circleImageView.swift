//
//  circleImageView.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/7/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class circleImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
    }

}
