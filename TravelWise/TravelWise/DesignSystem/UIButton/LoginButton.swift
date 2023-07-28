//
//  LoginButton.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

final class LoginButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        backgroundColor = MainColor.color
        tintColor = .white
        layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
