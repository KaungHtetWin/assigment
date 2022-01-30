//
//  AdvDetailVC.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 30/01/2022.
//

import Foundation
import UIKit

class AdvDetailVC: UIViewController {
  @IBOutlet weak var imgBanner: UIImageView!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblPrice: UILabel!
  @IBOutlet weak var lblUsername: UILabel!
  @IBOutlet weak var lblAccountName: UILabel!
  @IBOutlet weak var lblAddress: UILabel!
  @IBOutlet weak var txtDescription: UITextView!
  @IBOutlet weak var messageView: UIView!
  
  @IBAction func btnBackTapped(_ sender: Any) {
    navigationController?.dismiss(animated: true)
  }
  
  @IBAction func btnPhoneCallTapped(_ sender: Any) {
    makePhoneCall(phoneNo: AppConstants.defaultPhoneNo)
  }
  var adv: AdvertisementList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupData()
  }
  
  func setupView() {
    messageView.layer.cornerRadius = 30
  }
  
  func setupData() {
    imgBanner.image = UIImage(named: adv?.product?.productImage ?? "")
    lblTitle.text = adv?.product?.title
    lblPrice.text = "\(adv?.product?.price ?? 0) Kyats"
    lblUsername.text = adv?.seller?.userName
    lblAccountName.text = "@\(adv?.seller?.accountName ?? "")"
    lblAddress.text = "\(adv?.seller?.town ?? ""), \(adv?.seller?.township ?? "")"
    txtDescription.text = adv?.product?.productDescription
  }
}
