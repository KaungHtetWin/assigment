//
//  UIStoryboardAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import UIKit
public extension UIStoryboard {
  enum StoryBoard: String {
    case Auth
    case Home
    func instance(_ vc: String) -> UIViewController {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: vc)
    }
  }
  
  // MARK: - Auth StoryBoard
  class func loginVC() -> UIViewController {
    return StoryBoard.Auth.instance(LoginVC.className)
  }
  
  // MARK: - Home StoryBoard
  class func landingVC() -> UIViewController {
    return StoryBoard.Home.instance(LandingVC.className)
  }
  
  class func advDetailVC() -> UIViewController {
    return StoryBoard.Home.instance(AdvDetailVC.className)
  }
}
