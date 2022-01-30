//
//  HomeInteractor.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
  func doGetBanner(request: Home.Banner.Request)
  func doGetAdvertisement(request: Home.Advertisement.Request)
}

protocol HomeDataStore {
  //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
  var presenter: HomePresentationLogic?
  var worker = HomeWorker.shared
  //var name: String = ""
  
  // MARK: Do something
  
  func doGetBanner(request: Home.Banner.Request) {
    worker.doGetBanner(requestData: request, completed: { [weak self] (result, error) in
      if error != nil {
        self?.presenter?.presentError(errorString: error?.localizedDescription ?? "")
      } else {
        guard let res = result else {
          self?.presenter?.presentError(errorString: "Invalid response")
          return
        }
        self?.presenter?.presentBanner(response: res)
      }
    })
  }
  
  func doGetAdvertisement(request: Home.Advertisement.Request) {
    worker.doGeAdvertisement(requestData: request, completed: { [weak self] (result, error) in
      if error != nil {
        self?.presenter?.presentError(errorString: error?.localizedDescription ?? "")
      } else {
        guard let res = result else {
          self?.presenter?.presentError(errorString: "Invalid response")
          return
        }
        self?.presenter?.presentAdvertisement(response: res)
      }
    })
  }
}
