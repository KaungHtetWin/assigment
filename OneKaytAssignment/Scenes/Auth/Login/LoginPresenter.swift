//
//  LoginPresenter.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
  func presentLogin(response: Login.Post.Response)
  func presentError(errorString: String)
}

class LoginPresenter: LoginPresentationLogic {
  weak var viewController: LoginDisplayLogic?
  
  // MARK: Do something
  
  func presentLogin(response: Login.Post.Response) {
    let viewModel = Login.Post.ViewModel(errorMessage: response.errorMessage)
    viewController?.displayLogin(viewModel: viewModel)
  }
  func presentError(errorString: String) {
    viewController?.displayError(errorString: errorString)
  }
}
