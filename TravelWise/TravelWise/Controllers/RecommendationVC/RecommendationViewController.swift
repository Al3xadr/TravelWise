//
//  RecommendationViewController.swift
//  TravelWise
//
//  Created by apple on 25.07.2023.
//

import UIKit
import Kingfisher

final class RecommendationViewController: UIViewController {
    let viemodel = RecommendationViewModel()
    
    var recommendedCountries: String = ""
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    private let recomedationLabel: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        return label
    }()
    private let officialNameLabel: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .left
        return label
    }()
    private let capitalCountryNameLabel: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .center
        return label
    }()
    private let regionCountryNameLabel: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .center
        return label
    }()
    private let languagesCountry: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .left
        return label
    }()
    
    private let subregionCountryNameLabel: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .center
        return label
    }()
    private let populationountry: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        return label
    }()
    private let flagsCountry: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageView.layer.shadowRadius = 6
        imageView.layer.masksToBounds = false
        return imageView
    }()
    private let flagsCountryText: RecommendationVCLabel = {
        let label = RecommendationVCLabel()
        label.contentMode = .left
        return label
    }()
    private let infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("подробная информация", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(infoButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viemodel.fetchDataForCountry(countryName: recommendedCountries) { [weak self] error in
                    if let error = error {
                        print("Error: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self?.viemodel.updateUIWithCountryData { countryResponse in
                                if let countryResponse = countryResponse {
                                    self?.recomedationLabel.text = countryResponse.recommendedCountry
                                    self?.officialNameLabel.text = countryResponse.officialName
                                    self?.capitalCountryNameLabel.text = countryResponse.capital
                                    self?.flagsCountryText.text = countryResponse.flag
                                    self?.regionCountryNameLabel.text = countryResponse.region
                                    self?.flagsCountry.kf.setImage(with: countryResponse.flagImageURL)
                                    self?.subregionCountryNameLabel.text = countryResponse.subregion
                                    self?.languagesCountry.text = countryResponse.languages
                                    self?.populationountry.text = countryResponse.population
                                }
                            }
                        }
                    }
                }
        addImagesToStackView()
        setupUI()
    }
}
private extension RecommendationViewController {
    @objc private func infoButtonTapped(_ sender: UIButton) {
        let nextVC = InfoViewController()
        present(nextVC, animated: true)
    }
}
private extension RecommendationViewController {
    private func addImagesToStackView() {
        for imageName in StaticRecommendationVC.imageNames {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 35
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
            imageStackView.addArrangedSubview(imageView)
        }
    }
}

private extension RecommendationViewController {
    func setupUI() {
        view.addSubview(recomedationLabel)
        view.addSubview(officialNameLabel)
        view.addSubview(capitalCountryNameLabel)
        view.addSubview(flagsCountry)
        view.addSubview(flagsCountryText)
        view.addSubview(regionCountryNameLabel)
        view.addSubview(subregionCountryNameLabel)
        view.addSubview(languagesCountry)
        view.addSubview(scrollView)
        scrollView.addSubview(imageStackView)
        view.addSubview(populationountry)
        view.addSubview(infoButton)
        
        NSLayoutConstraint.activate([
            recomedationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            recomedationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recomedationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recomedationLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            officialNameLabel.topAnchor.constraint(equalTo: recomedationLabel.bottomAnchor, constant: 5),
            officialNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            officialNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            officialNameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            capitalCountryNameLabel.topAnchor.constraint(equalTo: officialNameLabel.bottomAnchor, constant: 5),
            capitalCountryNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            capitalCountryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            capitalCountryNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            flagsCountry.topAnchor.constraint(equalTo: capitalCountryNameLabel.bottomAnchor, constant: 5),
            flagsCountry.heightAnchor.constraint(equalToConstant: 80),
            flagsCountry.widthAnchor.constraint(equalToConstant: 80),
            flagsCountry.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        NSLayoutConstraint.activate([
            flagsCountryText.topAnchor.constraint(equalTo: flagsCountry.bottomAnchor, constant: 5),
            flagsCountryText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flagsCountryText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flagsCountryText.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            regionCountryNameLabel.topAnchor.constraint(equalTo: flagsCountryText.bottomAnchor, constant: 5),
            regionCountryNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regionCountryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            regionCountryNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            subregionCountryNameLabel.topAnchor.constraint(equalTo: regionCountryNameLabel.bottomAnchor, constant: 5),
            subregionCountryNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subregionCountryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subregionCountryNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            languagesCountry.topAnchor.constraint(equalTo: subregionCountryNameLabel.bottomAnchor, constant: 5),
            languagesCountry.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            languagesCountry.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            languagesCountry.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            populationountry.topAnchor.constraint(equalTo: languagesCountry.bottomAnchor, constant: 5),
            populationountry.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            populationountry.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            populationountry.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: populationountry.bottomAnchor, constant: 5),
            scrollView.heightAnchor.constraint(equalToConstant: 120),
        ])
        NSLayoutConstraint.activate([
            imageStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            imageStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5),
            imageStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 50),
            infoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
