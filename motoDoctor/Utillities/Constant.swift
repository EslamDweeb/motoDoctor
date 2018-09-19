//
//  Constant.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import Foundation
import UIKit
//URL
let BASE_URL = "http://192.168.2.14:8082/"
let Register_URL = "\(BASE_URL)api/Users/Register"
let Login_URL = "\(BASE_URL)api/Users/Login"
let UpdateUserInfo_URL = "\(BASE_URL)api/Customers/UpdateCustomerRegisteration"

// userDefault
let IsActive = "isactive"
let IsLogin = "islogin"
let ID = "id"
let UserName = "username"
let FullName = "fullname"
let UserType = "usertype"
let PhoneNum = "0109828929"
let Longitude = "12347,897"
let Latitude = "34287,7876"

//Device Info
let deviceID = UIDevice.current.identifierForVendor?.uuidString
let deviceType = "I"

//Header
let HEADER = ["Key": "t&6?!x&VwY$6D&LX",
"content-Type": "application/json; charset=utf-8"
]
