//
//  AdvertisementCell.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 30/01/2022.
//

import Foundation
import UIKit
class AdvertisementCell: UICollectionViewCell {
  @IBOutlet weak var imgAdv: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var price: UILabel!
  
  override class func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configure(data: Product?) {
    imgAdv.image = UIImage(named: data?.productImage ?? "")
    title.text = data?.title
    price.text = "\(data?.price ?? 0) lakhs"
  }
}
