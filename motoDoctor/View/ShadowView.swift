//
//  ShadowView.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/10/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
    }
}
