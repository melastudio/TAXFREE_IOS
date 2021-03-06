//
//  CheckBox.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 28.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    // Images
    let checkedImage = UIImage(named: "checked")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked")! as UIImage
    var value : String!

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self,action:#selector(buttonClicked),for:.touchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
    func setValue(value: String) {
        self.value=value
    }
    func getValue() -> String!{
        return self.value
    }
}
