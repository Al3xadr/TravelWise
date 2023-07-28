//
//  InterestCollectionViewCell.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
final class InterestCollectionViewCell: UICollectionViewCell {
    
    private let cornerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Property to store the selected state for each cell
    var isSelectedItem: Bool = false {
        didSet {
            if isSelectedItem {
                cornerView.layer.borderColor = MainColor.color.cgColor
                label.textColor = .white
                label.backgroundColor = MainColor.color
            } else {
                cornerView.layer.borderColor = MainColor.color.cgColor
                label.backgroundColor = .white
                label.textColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cornerView)
        cornerView.addSubview(label)
        NSLayoutConstraint.activate([
            cornerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cornerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cornerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            cornerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cornerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cornerView.trailingAnchor),
            label.topAnchor.constraint(equalTo: cornerView.topAnchor),
            label.bottomAnchor.constraint(equalTo: cornerView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with interest: String) {
        label.text = interest
        isSelectedItem = false
    }
}
