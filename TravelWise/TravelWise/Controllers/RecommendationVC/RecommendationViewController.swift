//
//  RecommendationViewController.swift
//  TravelWise
//
//  Created by apple on 25.07.2023.
//

import UIKit

final class RecommendationViewController: UIViewController {
    var recommendedCountries: String = "" {
        didSet {
            labelName.text = recommendedCountries
        }
    }
    private let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HUI"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupUI()
    }
}
private extension RecommendationViewController {
    func setupUI() {
        view.addSubview(labelName)
        NSLayoutConstraint.activate([
            labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
