//
//  DropDownView.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["عميل", "ورشة"]
    var tableView = UITableView()
    
    var delegate: DropDownProtocol!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = list[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: list[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}
