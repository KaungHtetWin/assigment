//
//  LoginVC.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

protocol LoginDisplayLogic: AnyObject {
  func displayLogin(viewModel: Login.Post.ViewModel)
  func displayError(errorString: String)
}

class LoginVC: UIViewController, LoginDisplayLogic {
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic)?
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: Do something
  
  @IBOutlet weak var txtPassword: OKTextField!
  @IBOutlet weak var txtPhone: OKTextField!
  @IBOutlet weak var btnLogin: UIButton!
  @IBOutlet weak var chkAgree: CheckBoxButton!
  @IBOutlet weak var btnTandC: UIButton!
  
  @IBAction func chkAgreeTapped(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    validateBtnLogin()
  }
  
  @IBAction func btnTandCTapped(_ sender: Any) {
    if let vc = openAppInbrowser(urlStr: AppConstants.tandCURL) {
      present(vc, animated: true)
    }
    
  }
  
  @IBAction func btnLoginTapped(_ sender: Any) {
    doLogin()
  }
  
  func setupView() {
    txtPhone.uiImage = UIImage(named: "phone")
    txtPhone.setPlaceholder(placeholder: "Phone Number")
    txtPhone.txtBox.delegate = self
    
    txtPassword.uiImage = UIImage(named: "password")
    txtPassword.setPlaceholder(placeholder: "Password")
    txtPassword.txtBox.delegate = self
    txtPassword.isPassword = true
    
    btnLogin.setOKButton("Login")
    btnLogin.setOKDisableButton()
    chkAgree.setTitle("Agree to our", for: .normal)
  }
  
  func doLogin() {
    let request = Login.Post.Request(phoneNo: txtPhone.text, password: txtPassword.text)
    btnLogin.showLoading()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.interactor?.doLogin(request: request)
    }
  }
  
  func displayLogin(viewModel: Login.Post.ViewModel) {
    Defaults[\.isLogin] = true
    router?.routeToLanding(nav: navigationController)
  }
  
  func displayError(errorString: String) {
    btnLogin.hideLoading()
    showAlert(message: errorString)
  }
  
  func validateBtnLogin() {
    if !txtPhone.text.isEmpty && !txtPassword.text.isEmpty && chkAgree.isSelected {
      btnLogin.setOKButton("Login")
    } else {
      btnLogin.setOKDisableButton()
    }
  }
}
extension LoginVC: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    validateBtnLogin()
  }
}
