//
//  ImageBall.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//
import UIKit
final class ImageBall: UIImageView {
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "ball")
        contentMode = .scaleToFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
