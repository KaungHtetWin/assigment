//
//  CheckBox.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 29/01/2022.
//

import UIKit
class CheckBoxButton: UIButton {
    
    override func awakeFromNib() {
        self.setImage(UIImage(named: "icoChecked"), for: .selected)
        self.setImage(UIImage(named: "icoUnChecked"), for: .normal)
    }
}
