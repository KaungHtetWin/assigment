//
//  LoginRouter.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
  func routeToLanding(nav: UINavigationController?)
}

class LoginRouter: NSObject, LoginRoutingLogic {
  weak var viewController: LoginVC?

  // MARK: Routing
  
  func routeToLanding(nav: UINavigationController?) {
    if let navigationController = nav {
      let vc =  UIStoryboard.landingVC() as? LandingVC
      navigationController.setDefaultStyle()
      navigationController.isNavigationBarHidden = true
      navigationController.setViewControllers([vc!], animated: true)
    }
  }
}
