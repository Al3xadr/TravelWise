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
        self.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        self.textAlignment = .center
        self.tintColor = .gray
        self.textColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
