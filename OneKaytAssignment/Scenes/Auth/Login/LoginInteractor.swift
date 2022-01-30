//
//  LoginInteractor.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
  func doLogin(request: Login.Post.Request)
}


class LoginInteractor: LoginBusinessLogic {
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?

  // MARK: Do Login
  
  func doLogin(request: Login.Post.Request) {
    worker = LoginWorker()
    worker?.doLogin(requestData: request, completed: {[weak self] (result, error) in
      if error != nil {
        self?.presenter?.presentError(errorString: error?.localizedDescription ?? "")
      } else {
        guard let res = result else {
          self?.presenter?.presentError(errorString: "Invalid response")
          return
        }
        if let errorMessage = res.errorMessage {
          self?.presenter?.presentError(errorString: errorMessage)
        } else {
          self?.presenter?.presentLogin(response: res)
        }
      }
    })
  }
}
