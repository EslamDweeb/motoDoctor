//
//  RoundedTextField.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/2/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedTextField: UITextField {
    
    @IBInspectable var image: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    
    override func awakeFromNib() {
        updateView()
    }
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    
    func updateView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 0.2671500428)
        
        if let image = image {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
    }
}


