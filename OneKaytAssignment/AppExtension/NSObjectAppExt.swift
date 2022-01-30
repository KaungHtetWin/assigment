//
//  NSObjectAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import Foundation

extension NSObject{
  var className: String {
    return String(describing: type(of: self))
  }
  
  class var className: String {
    return String(describing: self)
  }
}
