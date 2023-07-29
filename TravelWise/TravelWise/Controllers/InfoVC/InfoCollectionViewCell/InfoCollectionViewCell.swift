//
//  InfoCollectionViewCell.swift
//  TravelWise
//
//  Created by apple on 29.07.2023.
//

import UIKit
import Kingfisher
final class InfoCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    private let viewCorner: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderColor = MainColor.color.cgColor
        view.layer.borderWidth = 2.0
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
        
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension InfoCollectionViewCell {
    func configure(title: String, image: URL?, description: String) {
        titleLabel.text = title
        if let imageURL = image {
            imageView.kf.setImage(with: imageURL)
        }
        descriptionLabel.text = description
    }
}

private extension InfoCollectionViewCell {
    func setupUI() {
        contentView.addSubview(viewCorner)
        viewCorner.addSubview(titleLabel)
        viewCorner.addSubview(imageView)
        viewCorner.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            viewCorner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            viewCorner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            viewCorner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            viewCorner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: viewCorner.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: viewCorner.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: viewCorner.trailingAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalToConstant: 120),
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: viewCorner.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: viewCorner.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: viewCorner.trailingAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
