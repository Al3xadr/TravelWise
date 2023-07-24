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
        backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 1.0, alpha: 1.0) // Мягко голубой цвет
        tintColor = .white // Белый текст
        layer.cornerRadius = 10 // Радиус закругления краев
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
