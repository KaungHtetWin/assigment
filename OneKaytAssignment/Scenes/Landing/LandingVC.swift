//
//  LandingVC.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 29/01/2022.
//

import Foundation
import UIKit
class LandingVC: UITabBarController {
  @IBOutlet weak var landingTabBar: UITabBar!
  override func viewDidLoad() {
    super.viewDidLoad()
    landingTabBar.tintColor = AppTheme.Colors.main
    landingTabBar.barTintColor = .white
    landingTabBar.isTranslucent = false
    landingTabBar.backgroundColor = .white
    if #available(iOS 15.0, *) {
      let appearance = UITabBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = .white
      tabBar.isTranslucent = false
      tabBar.standardAppearance = appearance
      tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
  }
}
