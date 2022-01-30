//
//  HomePresenter.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
  func presentBanner(response: Home.Banner.Response)
  func presentAdvertisement(response: Home.Advertisement.Response)
  func presentError(errorString: String)
}

class HomePresenter: HomePresentationLogic {
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentBanner(response: Home.Banner.Response) {
    let viewModel = Home.Banner.ViewModel(banners: response.banners)
    viewController?.displayBanner(viewModel: viewModel)
  }
  func presentError(errorString: String){
    viewController?.displayError(errorString: errorString)
  }
  func presentAdvertisement(response: Home.Advertisement.Response) {
    let viewModel = Home.Advertisement.ViewModel(advertisement: response.advertisement)
    viewController?.displayAdvertisement(viewModel: viewModel)
  }
}
