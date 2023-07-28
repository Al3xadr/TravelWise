//
//  HomeVCLabel.swift
//  TravelWise
//
//  Created by apple on 26.07.2023.
//

import UIKit
final class HomeVCLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        self.textAlignment = .center
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.numberOfLines = 1
        self.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
