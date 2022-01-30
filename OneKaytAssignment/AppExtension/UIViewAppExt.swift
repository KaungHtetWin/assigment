//
//  UIViewAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import UIKit
extension UIView {
  
  /* BORDER */
  @IBInspectable var viewBorderColor: UIColor? {
    set {
      layer.borderColor = newValue!.cgColor
    }
    get {
      if let color = layer.borderColor {
        return UIColor(cgColor: color)
      } else {
        return nil
      }
    }
  }
  @IBInspectable var viewBorderWidth: CGFloat {
    set {
      layer.borderWidth = newValue
    }
    get {
      return layer.borderWidth
    }
  }

  /* BORDER RADIUS */
  @IBInspectable var viewCornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
      clipsToBounds = newValue > 0
    }
    get {
      return layer.cornerRadius
    }
  }

  /* SHADOW */
  @IBInspectable var viewShadowColor: UIColor? {
    set {
      layer.shadowColor = newValue!.cgColor
    }
    get {
      if let color = layer.shadowColor {
        return UIColor(cgColor: color)
      } else {
        return nil
      }
    }
  }
  @IBInspectable var viewShadowOpacity: Float {
    set {
      layer.shadowOpacity = newValue
    }
    get {
      return layer.shadowOpacity
    }
  }
  @IBInspectable var viewShadowOffset: CGSize {
    set {
      layer.shadowOffset = newValue
    }
    get {
      return layer.shadowOffset
    }
  }
  @IBInspectable var viewShadowRadius: CGFloat {
    set {
      layer.shadowRadius = newValue
    }
    get {
      return layer.shadowRadius
    }
  }
//
//  public class func fromNib(nibName: String? = nil) -> Self {
//    return fromNib(nibName: nibName, type: self)
//  }
//
//  public class func fromNib<T: UIView>(nibName: String? = nil, type: T.Type) -> T {
//    return fromNib(nibName: nibName, type: T.self)!
//  }
//
//  public class func fromNib<T: UIView>(nibName: String? = nil, type: T.Type) -> T? {
//    var view: T?
//    let name: String
//
//    if let nibName = nibName {
//      name = nibName
//    } else {
//      name = self.nibName
//    }
//
//    if let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) {
//      for nibView in nibViews {
//        if let tog = nibView as? T {
//          view = tog
//        }
//      }
//    }
//
//    return view
//  }
//
//  public class var nibName: String {
//    return "\(self)".components(separatedBy: ".").first ?? ""
//  }
//
//  public class var nib: UINib? {
//    if Bundle.main.path(forResource: nibName, ofType: "nib") != nil {
//      return UINib(nibName: nibName, bundle: nil)
//    } else {
//      return nil
//    }
//  }
//
  func fixInView(_ container: UIView!) {
      self.translatesAutoresizingMaskIntoConstraints = false
      self.frame = container.frame
      container.addSubview(self)
      NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
      NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
      NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
      NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
  }
}
