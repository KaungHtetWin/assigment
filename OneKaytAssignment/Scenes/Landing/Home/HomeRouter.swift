//
//  HomeRouter.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
  func routeToLogin(nav: UINavigationController?)
  func routeToAdvDetail(nav: UINavigationController?)
}

class HomeRouter: NSObject, HomeRoutingLogic {
  weak var viewController: HomeVC?
  var dataStore: HomeDataStore?
  
  // MARK: Routing
  
  func routeToLogin(nav: UINavigationController?) {
    if let navigationController = nav {
      let vc =  UIStoryboard.loginVC() as? LoginVC
      navigationController.setDefaultStyle()
      navigationController.isNavigationBarHidden = false
      navigationController.setViewControllers([vc!], animated: true)
    }
  }
  
  func routeToAdvDetail(nav: UINavigationController?) {
    if let navigationController = nav {
      let vc =  UIStoryboard.advDetailVC() as? AdvDetailVC
      guard let index = viewController?.advCollectionCell.indexPathsForSelectedItems?.first else { return }
      vc?.adv = viewController?.advList[index.row]
      vc?.hidesBottomBarWhenPushed = true
      let detailNav = UINavigationController(rootViewController: vc!)
      detailNav.isNavigationBarHidden = true
      detailNav.modalPresentationStyle = .fullScreen
      navigationController.present(detailNav, animated: true, completion: nil)
    }
  }
  
}
