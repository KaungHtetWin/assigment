//
//  AdvertisementModel.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 30/01/2022.
//

import Foundation
import RealmSwift

// MARK: Model
class AdvertisementRO: Object {
  @objc dynamic var id = ""
  @objc dynamic var product: ProductRO?
  @objc dynamic var seller: SellerRO?
  
  convenience init(id: String, product: ProductRO, seller: SellerRO) {
    self.init()
    self.id = id
    self.product = product
    self.seller = seller
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  func getAdvertisement() -> [AdvertisementList]? {
    var advObj: [AdvertisementList] = []
    do {
      let realm = try! Realm()
      let advs = realm.objects(AdvertisementRO.self)
      for adv in advs {
        let product = adv.product?.toObject()
        let seller = adv.seller?.toObject()
        let advertisement = AdvertisementList(product: product, seller: seller)
        advObj.append(advertisement)
      }
    } catch let error as NSError {
      print(error)
      return advObj
    }
    return advObj
  }
  
  func addAdvertisement() {

    let prodcut = ProductRO(value: ["productImage": "car-1", "title": "Audi 100 2021", "productDescription": "Redmi 9 4/64\n Gobal version\n Offical Warranty 4လကျော်\nError ကင်းအလုံသန့်\n 98% like new","price": 100000])
    let prodcut2 = ProductRO(value: ["productImage": "car-2", "title": "Mazda Demio 2008", "productDescription": "Redmi 9 4/64\n Gobal version\n Offical Warranty 4လကျော်\nError ကင်းအလုံသန့်\n 98% like new","price": 100000])
    let prodcut3 = ProductRO(value: ["productImage": "car-1", "title": "Audi 100 2021", "productDescription": "Redmi 9 4/64\n Gobal version\n Offical Warranty 4လကျော်\nError ကင်းအလုံသန့်\n 98% like new","price": 100000])
    let prodcut4 = ProductRO(value: ["productImage": "car-2", "title": "Mazda Demio 2008", "productDescription": "Redmi 9 4/64\n Gobal version\n Offical Warranty 4လကျော်\nError ကင်းအလုံသန့်\n 98% like new","price": 100000])
    let seller = SellerRO(value: ["profileImage": "", "userName": "သူဇာအောင်", "accountName": "thuzaraung","town": "ရန်ကုန်မြို့", "township": "ရန်ကုန်တိုင်း"])
    
    let adv1 = AdvertisementRO(id: "1", product: prodcut, seller: seller)
    let adv2 = AdvertisementRO(id: "2", product: prodcut2, seller: seller)
    let adv3 = AdvertisementRO(id: "3", product: prodcut3, seller: seller)
    let adv4 = AdvertisementRO(id: "4", product: prodcut4, seller: seller)
    
    do {
      let realm = try! Realm()
      try! realm.write {
        realm.add(adv1)
        realm.add(adv2)
        realm.add(adv3)
        realm.add(adv4)
      }
    } catch let error as NSError {
      print(error)
    }
  }
}

final class ProductRO: Object {
  @objc dynamic var productImage: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var productDescription: String = ""
  @objc dynamic var price: Int = 0
  
  func toObject() -> Product {
    let product = Product(productImage: self.productImage,title: self.title, productDescription: self.productDescription ,price: self.price)
    return product
  }
}


final class SellerRO: Object {
  @objc dynamic var profileImage: String = ""
  @objc dynamic var userName: String = ""
  @objc dynamic var accountName: String = ""
  @objc dynamic var town: String = ""
  @objc dynamic var township: String = ""
  
  func toObject() -> Seller {
    let seller = Seller(profileImage: self.profileImage,
                        userName: self.userName,
                        accountName: self.accountName,
                        town: self.town ,
                        township: self.township)
    return seller
  }
}
