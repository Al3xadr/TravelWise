//
//  InterestCollectionViewCell.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
final class InterestCollectionViewCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Property to store the selected state for each cell
    var isSelectedItem: Bool = false {
        didSet {
            if isSelectedItem {
                contentView.backgroundColor = .lightGray
                label.textColor = .white
            } else {
                contentView.backgroundColor = .white
                label.textColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with interest: String) {
        label.text = interest
        isSelectedItem = false // Set initial state to deselected
    }
}
