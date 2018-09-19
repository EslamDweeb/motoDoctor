//
//  ContainerVC.swift
//  motoDoctor
//
//  Created by eslam dweeb on 7/7/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import QuartzCore
import CoreLocation

enum SlideOutState {
    case collapsed
    case rightPanelExpanded
}
enum ShowWhichVC {
    case maintenanceServiceVC
    case fristVC
}
var showVC: ShowWhichVC = .maintenanceServiceVC

class ContainerVC: UIViewController {
    let locationManager = CLLocationManager()

    var maintenanceServiceVC: MaintenaceServiceVC!
    var rightVC: RightSidePanelVC!
    var currentState: SlideOutState = .collapsed
    var centerController: UIViewController!
    var fristVC: FristVC!
    
    var tap: UITapGestureRecognizer!
    var isHidden = false
    let centerPanelExpandedOffset: CGFloat = 80
    let authService = AuthService()

    override func viewDidLoad() {
        super.viewDidLoad()
        initCenter(screen: showVC)
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
      
    }
    
    func initCenter(screen: ShowWhichVC) {
        
        showVC = screen
        var presentingController: UIViewController
        
        if authService.isLogin == false {
            if fristVC == nil {
                fristVC = UIStoryboard.firstController()
                fristVC.delegate = self
                showVC = .fristVC
            }
            presentingController = fristVC
        }else{
            if maintenanceServiceVC == nil {
                maintenanceServiceVC = UIStoryboard.maintenanceServiceVC()
                maintenanceServiceVC.delegate = self
                showVC = .maintenanceServiceVC
            }
            presentingController = maintenanceServiceVC
        }
        
        if let con = centerController{
            con.view.removeFromSuperview()
            con.removeFromParentViewController()
        }
        centerController = presentingController
        view.addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController: self)
        
    }
    override var prefersStatusBarHidden: Bool{
        return isHidden
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return UIStatusBarAnimation.slide
    }
}
extension ContainerVC: CenterVCDelegate {
    func toggleRightPanel() {
        let notAlreadyExpanded = (currentState != .rightPanelExpanded)
        if notAlreadyExpanded {
            addRightPanelViewController()
        }
        animateRightPanel(shouldExpand: notAlreadyExpanded)
    }
    func addRightPanelViewController() {
        if rightVC == nil {
            rightVC = UIStoryboard.rightViewController()
            addChildSidePanelViewController(rightVC!)
        }
    }
    func addChildSidePanelViewController(_ sidePanelViewController: RightSidePanelVC){
        view.insertSubview(sidePanelViewController.view, at: 0)
        addChildViewController(sidePanelViewController)
        sidePanelViewController.didMove(toParentViewController: self)
    }
    
    @objc func animateRightPanel(shouldExpand: Bool) {
        if shouldExpand {
            isHidden = !isHidden
            animateStatusBar()
            
            currentState = .rightPanelExpanded
            animateCenterPanelXPosition(targetPosition: -centerController.view.frame.width + centerPanelExpandedOffset)
        }else{
            isHidden = !isHidden
            animateStatusBar()
            
            animateCenterPanelXPosition(targetPosition: 0, completion: { (finished) in
                if finished {
                    self.currentState = .collapsed
                    self.rightVC = nil
                }
            })
        }
        tap = UITapGestureRecognizer(target: self, action: #selector(animateRightPanel(shouldExpand:)))
        tap.numberOfTapsRequired = 1
        self.centerController.view.addGestureRecognizer(tap)
       
    }
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    func animateStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
}
private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    class func rightViewController() -> RightSidePanelVC {
        return mainStoryboard().instantiateViewController(withIdentifier: "RightSidePanelVC") as! RightSidePanelVC
    }
    class func maintenanceServiceVC() -> MaintenaceServiceVC {
        return mainStoryboard().instantiateViewController(withIdentifier: "MaintenaceServiceVC") as! MaintenaceServiceVC
    }
    class func firstController() -> FristVC {
        return mainStoryboard().instantiateViewController(withIdentifier: "FristVC") as! FristVC
    }
}
extension ContainerVC : CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            print(location.coordinate)
//        }
//    }
}
