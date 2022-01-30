//
//  HomeModels.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Home {
  // MARK: Use cases
  
  enum Banner {
    struct Request {
    }
    struct Response {
      var banners: [String]
    }
    struct ViewModel {
      var banners: [String]
    }
  }
  enum Advertisement {
    struct Request {
    }
    struct Response {
      var advertisement: [AdvertisementList]?
    }
    struct ViewModel {
      var advertisement: [AdvertisementList]?
    }
  }
}
// MARK: - Advertisement
struct AdvertisementList: Codable {
  var product: Product?
  var seller: Seller?
}
// MARK: - Product
struct Product: Codable {
    var productImage, title, productDescription: String?
    var price: Int?

    enum CodingKeys: String, CodingKey {
        case productImage = "product_image"
        case title
        case productDescription = "description"
        case price
    }
}

// MARK: - Seller
struct Seller: Codable {
    var profileImage, userName, accountName, town: String?
    var township: String?

    enum CodingKeys: String, CodingKey {
        case profileImage = "profile_image"
        case userName = "user_name"
        case accountName = "account_name"
        case town, township
    }
}
