//
//  UIViewControllerAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 29/01/2022.
//


import UIKit
import SafariServices
extension UIViewController {
  func showAlert(tittle: String? = "Error", message: String, okHandler: (()->Void)? = nil) {
    let dialogMessage = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
      okHandler?()
    })
    dialogMessage.addAction(ok)
    self.present(dialogMessage, animated: true, completion: nil)
  }
  
  func openAppInbrowser(urlStr: String) -> SFSafariViewController? {
    if let url = URL(string: urlStr) {
      let vc = SFSafariViewController(url: url)
      return vc
    }
    return nil
  }
  
  func confirmAlert(message: String, okHandler: (()->Void)? = nil) {
    let dialogMessage = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
      okHandler?()
    })
    dialogMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    dialogMessage.addAction(ok)
    self.present(dialogMessage, animated: true, completion: nil)
  }
  
  func makePhoneCall(phoneNo: String) {
    if let url = URL(string: "tel://\(phoneNo)"), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
  }
}
