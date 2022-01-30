//
//  LoginWorker.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LoginWorker {
  func doLogin(requestData: Login.Post.Request, completed: @escaping (_ JSONObject: Login.Post.Response?, _ error: Error?) -> Void) {
    if let phoneNo = requestData.phoneNo, let password = requestData.password {
      if phoneNo == AppConstants.defaultPhoneNo && password == AppConstants.defaultPassword {
        let response = Login.Post.Response(errorMessage: nil)
        completed(response, nil)
      } else {
        let response = Login.Post.Response(errorMessage: "Invaild phone no or password")
        completed(response, nil)
      }
    } else {
      let response = Login.Post.Response(errorMessage: "Phone no and password are required")
      completed(response, nil)
    }
  }
}
