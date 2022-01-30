//
//  HomeWorker.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeWorker {
  static let shared = HomeWorker()
  func doGetBanner(requestData: Home.Banner.Request, completed: @escaping (_ JSONObject: Home.Banner.Response?, _ error: Error?) -> Void) {
    let imgBanner = ["banner-1", "banner-2", "banner-3", "banner-4", "banner-5", "banner-6", "banner-7"]
    let response = Home.Banner.Response(banners: imgBanner)
    completed(response, nil)
  }
  
  func doGeAdvertisement(requestData: Home.Advertisement.Request, completed: @escaping (_ JSONObject: Home.Advertisement.Response?, _ error: Error?) -> Void) {
    if let advs = AdvertisementRO().getAdvertisement(), !advs.isEmpty {
      let response = Home.Advertisement.Response(advertisement: advs)
      completed(response, nil)
    } else {
      AdvertisementRO().addAdvertisement()
      if let advs = AdvertisementRO().getAdvertisement() {
        let response = Home.Advertisement.Response(advertisement: advs)
        completed(response, nil)
      }
    }
  }
}
