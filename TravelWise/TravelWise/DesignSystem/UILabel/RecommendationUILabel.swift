//
//  RecommendationUILabel.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import UIKit
final class RecommendationVCLabel: UILabel {
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        self.textAlignment = .center
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
