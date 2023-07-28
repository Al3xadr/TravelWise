//
//  RegisterUILabel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
final class RegisterLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font =  UIFont.boldSystemFont(ofSize: 16)
        self.tintColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
