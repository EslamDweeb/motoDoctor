//
//  AuthSevice.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLogin: Bool {
        get {
            return defaults.bool(forKey: IsLogin)
        }
        set{
             defaults.set(newValue, forKey: IsLogin)
        }
    }
    var isActive: Bool{
        get{
            return defaults.bool(forKey: IsActive)
        }
        set{
            defaults.set(newValue, forKey: IsActive)
        }
    }
    
    var id: Int {
        get{
            return defaults.integer(forKey: ID)
        }
        set{
            defaults.set(newValue, forKey: ID)
        }
    }
    var userName: String{
        get{
            return defaults.value (forKey: UserName) as! String
        }
        set{
            defaults.set(newValue, forKey: UserName)
        }
    }
    var fullName: String{
        get{
            return defaults.value (forKey: FullName) as! String
        }
        set{
            defaults.set(newValue, forKey: FullName)
        }
    }
    var userType :String{
        get{
            return defaults.value (forKey: UserType) as! String
        }
        set{
            defaults.set(newValue, forKey: UserType)
        }
    }
    var phoneNum: String{
        get{
            return defaults.value (forKey: PhoneNum) as! String
        }
        set{
            defaults.set(newValue, forKey: PhoneNum)
        }
    }
//    var longitude: String{
//        get{
//            return defaults.value (forKey: Longitude) as! String
//        }
//        set{
//            defaults.set(newValue, forKey: Longitude)
//        }
//    }
//    var latitude: String{
//        get{
//            return defaults.value (forKey: Latitude) as! String
//        }
//        set{
//            defaults.set(newValue, forKey: Latitude)
//        }
//    }
   
    
    func registerUser(fullName: String,phoneNum: String,userName: String,password: String,deviceType: String, deviceID: String,confirmPassword: String,userType: String,completionHandler: @escaping (_ status: Bool?) -> Void) {
        let body: [String: Any] = [
            "userName": userName,"FullName": fullName,"password": password,"ConfirmPassword": confirmPassword,"Mobile": phoneNum,"Token": deviceID,"DeviceType": deviceType,"userType":userType
        ]
        Alamofire.request(Register_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else{return}
                do {
                    let json = try JSON(data: data)
                    self.isActive = json["IsActive"].bool!
                    self.userType = json["UsreType"].stringValue
                    self.fullName = json["FullName"].stringValue
                    self.id = json["ID"].intValue
                    self.userName = json["UserName"].stringValue
                    print(json)
                }catch let jsonError {
                    debugPrint(jsonError)
                }
                completionHandler(true)
            }else{
                debugPrint(response.result.error as Any)
                completionHandler(false)
            }
        }
    }
    func loginUser(userName: String,Password: String,token: String,completionHandler: @escaping (_ status: Bool?) -> Void) {
        let body: [String:Any] = ["username": userName,"Password": Password,"token": token]
        Alamofire.request(Login_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else{return}
                do {
                    let json = try JSON(data: data)
                    self.isActive = json["IsActive"].bool!
                    self.userType = json["UsreType"].stringValue
                    self.fullName = json["FullName"].stringValue
                    self.id = json["ID"].intValue
                    self.userName = json["UserName"].stringValue
                    print(self.fullName,self.isActive,self.id,self.userType,self.userName)
                    print(json)
                    
                }catch let jsonErr {
                    debugPrint(jsonErr)
                }
                completionHandler(true)
                self.isLogin = true
            }else{
                debugPrint(response.result.error as Any)
                completionHandler(false)
            }
        }
        
    }
    func updateUserInfo(id: Int,firstNameAr: String,firstNameEn: String,lastNameAr: String,lastNameEn: String,mobile: String,countryID: Int?, cityID: Int?,districtID: Int?,longitude: String,latitude: String,userID: Int,isActive: Bool,completionHandler: @escaping (_ status: Bool?) -> Void) {
        let body: [String:Any] = ["ID": id,"FirstNameAr": firstNameAr,"FirstNameEn": firstNameEn,"LastNameAr": lastNameAr,"LastNameEN": lastNameEn,"Mobile": mobile,"CountryID": countryID as Any,"CityID": cityID as Any,"DistrictID": districtID as Any,"Longitude": longitude,"Latitude": latitude,"UserID": userID,"IsActive": isActive]
        Alamofire.request(UpdateUserInfo_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else{return}
                do {
                    let json = try JSON(data:data)
                    print(json)
                    self.id = json["UserID"].intValue
                    self.userName = json["Mobile"].stringValue
                    self.fullName = json["FirstNameAr"].stringValue + json ["LastNameAr"].stringValue
                    
                }catch let jsonErr{
                    debugPrint(jsonErr)
                }
            }else{
                debugPrint(response.result.error as Any)
                completionHandler(false)
            }
        }
    }

}
