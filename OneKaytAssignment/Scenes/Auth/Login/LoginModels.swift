//
//  LoginModels.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Login {
  // MARK: Use cases
  
  enum Post {
    struct Request {
      var phoneNo: String?
      var password: String?
    }
    struct Response {
      var errorMessage: String?
    }
    struct ViewModel {
      var errorMessage: String?
    }
  }
}
