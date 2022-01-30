//
//  OKTextField.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//

import UIKit
class OKTextField: UIView {
  
  @IBOutlet weak var txtBox: UITextField!
  @IBOutlet weak var imgTextField: UIImageView!
  
  var isPassword = false {
    didSet {
      setPassword()
    }
  }
  
  var uiImage: UIImage? = UIImage() {
    didSet {
      imgTextField.image = uiImage
    }
  }
  
  var text: String {
      get {
          return txtBox.text ?? ""
      }
      set {
          txtBox.text = newValue
      }
  }
  
  // MARK: - Views Life Cycle Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  // MARK: - Methods
  private func setup() {
    let customView = loadViewFromNib()
    customView.fixInView(self)
    addSubview(customView)
  }
  
  fileprivate func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: OKTextField.className, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    return view
  }
  
  private func setPassword() {
    txtBox.isSecureTextEntry = true
    txtBox.rightViewMode = .always
    txtBox.rightView = passwordToggleView()
  }
  
  func setPlaceholder(placeholder: String) {
    txtBox.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: AppTheme.Colors.placeHolderColor])
  }
  
  private func passwordToggleView() -> UIView {
    let eyeView = UIView(frame: CGRect(x: 0, y: 0, width: 66, height: txtBox.frame.height))
    let eyeButton = UIButton(frame: CGRect(x: eyeView.frame.width/2 - 15, y: eyeView.frame.height/2 - 15, width: 30, height: 30))
    eyeButton.backgroundColor = UIColor.clear
    eyeButton.adjustsImageWhenHighlighted = false
    eyeButton.setImage(UIImage(named: "icEyeOpen"), for: .selected)
    eyeButton.setImage(UIImage(named: "icEyeClosed"), for: .normal)
    
    eyeButton.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
    eyeButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    eyeView.addSubview(eyeButton)
    return eyeView
  }
  
  // MARK: - Target Methods
  @objc func eyeButtonPressed(sender: UIButton) {
      sender.isSelected = !sender.isSelected
      txtBox.isSecureTextEntry = !txtBox.isSecureTextEntry
  }
}
