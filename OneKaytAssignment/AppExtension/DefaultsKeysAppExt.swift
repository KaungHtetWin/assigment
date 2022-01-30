//
//  DefaultsKeysAppExt.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import SwiftyUserDefaults

extension DefaultsKeys {
  var isLogin: DefaultsKey<Bool> { .init(Keys.isLogin, defaultValue: false) }
  var userPhoneNo: DefaultsKey<String?> { .init("userPhoneNo") }
}
struct Keys {
  static let isLogin = "isLogin"
  static let userPhoneNo = "userPhoneNo"
}
