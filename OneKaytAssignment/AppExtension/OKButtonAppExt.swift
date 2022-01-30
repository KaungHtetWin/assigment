//
//  OKButtonAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 29/01/2022.
//

import Foundation
import UIKit
extension UIButton {
  
  func setOKButton(_ text: String) {
    self.setTitleColor(AppTheme.Colors.buttonText, for: .normal)
    self.setTitle(text, for: .normal)
    self.layer.cornerRadius = 8
    self.backgroundColor = AppTheme.Colors.main
    self.isUserInteractionEnabled = true
  }
  
  func setOKDisableButton() {
    self.setTitleColor(UIColor.black, for: .normal)
    self.layer.cornerRadius = 8
    self.backgroundColor = AppTheme.Colors.buttonDisable
    self.isUserInteractionEnabled = false
  }
  
  func showLoading() {
    self.isUserInteractionEnabled = false
    self.addSubview(getLoader())
  }
  
  func hideLoading() {
    self.isUserInteractionEnabled = true
    self.viewWithTag(9090)?.removeFromSuperview()
  }
  
  private func getLoader() -> UIActivityIndicatorView {
    let loader = UIActivityIndicatorView(frame: CGRect(x: frame.width - 50 , y: frame.height/2 - 25, width: 50, height: 50))
    loader.hidesWhenStopped = true
    loader.style = UIActivityIndicatorView.Style.white
    loader.tag = 9090
    loader.startAnimating()
    return loader
  }
}
