//
//  IntroRouter.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import UIKit

@objc protocol IntroRoutingLogic {
    func routeToLanding(nav: UINavigationController?)
    func routeToLogin(nav: UINavigationController?)
}

class IntroRouter: NSObject, IntroRoutingLogic {
    weak var viewController: IntroVC?
  
    func routeToLanding(nav: UINavigationController?) {
      if let navigationController = nav {
        let vc =  UIStoryboard.landingVC() as? LandingVC
        navigationController.setDefaultStyle()
        navigationController.isNavigationBarHidden = true
        navigationController.setViewControllers([vc!], animated: true)
      }
    }
    
    func routeToLogin(nav: UINavigationController?) {
        if let navigationController = nav {
          let vc =  UIStoryboard.loginVC() as? LoginVC
          navigationController.setDefaultStyle()
          navigationController.isNavigationBarHidden = false
          navigationController.setViewControllers([vc!], animated: true)
        }
    }
}
