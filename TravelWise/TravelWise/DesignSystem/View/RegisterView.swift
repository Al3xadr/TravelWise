//
//  RegisterView.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit
final class RoundedCornerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
}
