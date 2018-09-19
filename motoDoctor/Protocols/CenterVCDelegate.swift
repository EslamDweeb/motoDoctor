//
//  CenterVCDelegate.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/7/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
protocol CenterVCDelegate {
    func toggleRightPanel()
    func addRightPanelViewController()
    func animateRightPanel(shouldExpand: Bool)
}
