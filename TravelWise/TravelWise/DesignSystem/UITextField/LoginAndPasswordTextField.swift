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
        
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        borderStyle = .roundedRect
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
