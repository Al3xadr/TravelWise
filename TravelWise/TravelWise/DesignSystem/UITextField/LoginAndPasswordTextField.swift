//
//  LoginTextField.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

final class LoginAndPasswordTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        borderStyle = .roundedRect
        self.layer.borderColor = MainColor.color.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
