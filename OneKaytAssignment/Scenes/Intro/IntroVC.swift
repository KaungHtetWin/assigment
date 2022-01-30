//
//  IntroVC.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import SwiftyUserDefaults
import UIKit
class IntroVC: UIViewController {
  var router: (NSObjectProtocol & IntroRoutingLogic)?
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let router = IntroRouter()
    viewController.router = router
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    if Defaults[\.isLogin] {
      router?.routeToLanding(nav: navigationController)
    } else {
      router?.routeToLogin(nav: navigationController)
    }
  }
}
