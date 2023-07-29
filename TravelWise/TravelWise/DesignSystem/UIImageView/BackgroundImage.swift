//
//  BackgroundImage.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit
struct DesignImage {
    static let backgroundImage: UIImage? = UIImage(named: "background")
}

final class BackgroundImageView: UIImageView {
    init() {
        super.init(image: DesignImage.backgroundImage)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
