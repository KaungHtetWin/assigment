//
//  UINavigationBarAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 29/01/2022.
//
import UIKit
extension UINavigationController {
    func setDefaultStyle() {
        isNavigationBarHidden = true
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .white
        navigationBar.barTintColor = UIColor(red: 64 / 255.0, green: 162 / 255.0, blue: 1 / 255.0, alpha: 1)
        navigationBar.titleTextAttributes = [
          NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        // White non-transucent navigatio bar, supports dark appearance
        view.backgroundColor = UIColor(red: 64 / 255.0, green: 162 / 255.0, blue: 1 / 255.0, alpha: 1)
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
