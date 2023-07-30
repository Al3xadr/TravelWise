//
//  HomeViewController.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
import MultiSlider
import CoreML
final class HomeViewController: UIViewController {
    private let viewModel = HomeViewModelML()
    private let interestsData = StaticHomeVC.interestsData
    
    private var selectedRating: Int = 0
    private var selectedInterests: [String] = []
    // MARK: - UI Elements
    private let ballImage: ImageBall = {
        let image = ImageBall()
        return image
    }()
    private let interestsLabel: HomeVCLabel = {
        let label = HomeVCLabel(text: StaticHomeVC.interests)
        return label
    }()
    private let interestsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let budgetLabel: HomeVCLabel = {
        let label = HomeVCLabel(text: StaticHomeVC.budget )
        return label
    }()
    
    private let housingLabel: HomeVCLabel = {
        let label = HomeVCLabel(text: StaticHomeVC.preferredHousing)
        return label
    }()
    
    private let occupationLabel: HomeVCLabel = {
        let label = HomeVCLabel(text: StaticHomeVC.occupation)
        return label
    }()
    
    private lazy var interestsCategoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let budgetSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.tintColor = MainColor.color
        return slider
    }()
    private let housingSegmentedControl: UISegmentedControl = {
        let items = StaticHomeVC.itemsSegmentedControl
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let occupationTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticHomeVC.jobOrTravel)
        return textField
    }()
    private let starRatingView: RatingStarsView = {
        let star = RatingStarsView()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.contentMode = .scaleAspectFit
        star.rating = 3
        return star
    }()
    
    private let saveButton: LoginButton = {
        let button = LoginButton(title: StaticHomeVC.recomendation)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    private let backgroundImage: BackgroundImageView = {
        let image = BackgroundImageView()
        return image
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingCollection()
        starRatingView.ratingDidChange = { [weak self] rating in
            self?.selectedRating = rating
        }
        
    }
}

private extension HomeViewController {
    @objc func sliderValueChanged(_ slider: MultiSlider) {
        updateSliderValueLabel()
    }
    
    func updateSliderValueLabel() {
        let currentValue = Int(budgetSlider.value)
        budgetLabel.text = "Budget: \(currentValue)000 $"
    }
    // MARK: - Actions
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        collectUserData()
    }
}
private extension HomeViewController {
    func collectUserData() {
        let budget = Double(budgetSlider.value)
        let preferredHousing = String(housingSegmentedControl.selectedSegmentIndex)
        let interests = selectedInterests.joined(separator: " ")
        let rating = Double(selectedRating)
        let recommendedCountries = viewModel.collectUserData(interests: interests, budget: budget, preferredHousing: preferredHousing, rating: rating)
        print(recommendedCountries)
        nextVC(recommendedCountries: recommendedCountries)
    }
    func nextVC(recommendedCountries: String) {
        let nextViewController = RecommendationViewController()
        nextViewController.recommendedCountries = recommendedCountries
        present(nextViewController, animated: true)
    }
    
}
//MARK: - settingCollectionView
private extension HomeViewController {
    func settingCollection() {
        interestsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        interestsCollectionView.dataSource = self
        interestsCollectionView.delegate = self
        interestsCollectionView.register(InterestCollectionViewCell.self, forCellWithReuseIdentifier: HomeCell.InterestCell)
    }
    
}
//MARK: - UICollectionViewDataSource and UICollectionViewDelegateFlowLayout,  UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestsData.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interest = interestsData[indexPath.item]
        let textWidth = collectionView.bounds.width - 20
        let textHeight = interest.height(withConstrainedWidth: textWidth, font: UIFont.systemFont(ofSize: 17))
        return CGSize(width: textWidth, height: textHeight + 20)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.InterestCell, for: indexPath) as! InterestCollectionViewCell
        let interest = interestsData[indexPath.item]
        cell.configure(with: interest)
        cell.isSelectedItem = selectedInterests.contains(interest)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedInterest = interestsData[indexPath.item]
        if selectedInterests.contains(selectedInterest) {
            selectedInterests.removeAll { $0 == selectedInterest }
        } else {
            selectedInterests.append(selectedInterest)
        }
        collectionView.reloadItems(at: [indexPath])
    }
}

//MARK: - SetupUI
extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(ballImage)
        view.addSubview(interestsLabel)
        view.addSubview(interestsCollectionView)
        view.addSubview(interestsCategoriesStackView)
        view.addSubview(budgetLabel)
        view.addSubview(budgetSlider)
        view.addSubview(housingLabel)
        view.addSubview(housingSegmentedControl)
        view.addSubview(occupationLabel)
        view.addSubview(occupationTextField)
        view.addSubview(starRatingView)
        view.addSubview(saveButton)
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            ballImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ballImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImage.widthAnchor.constraint(equalToConstant: 50),
            ballImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            interestsLabel.topAnchor.constraint(equalTo: ballImage.bottomAnchor, constant: 10),
            interestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            interestsCollectionView.topAnchor.constraint(equalTo: interestsLabel.bottomAnchor, constant: 20),
            interestsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            interestsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            interestsCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            interestsCategoriesStackView.topAnchor.constraint(equalTo: interestsCollectionView.bottomAnchor, constant: 10),
            interestsCategoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            interestsCategoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            budgetLabel.topAnchor.constraint(equalTo: interestsCategoriesStackView.bottomAnchor, constant: 20),
            budgetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            budgetSlider.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: 10),
            budgetSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            budgetSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            housingLabel.topAnchor.constraint(equalTo: budgetSlider.bottomAnchor, constant: 20),
            housingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            housingSegmentedControl.topAnchor.constraint(equalTo: housingLabel.bottomAnchor, constant: 10),
            housingSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            housingSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            housingSegmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            occupationLabel.topAnchor.constraint(equalTo: housingSegmentedControl.bottomAnchor, constant: 20),
            occupationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            occupationTextField.topAnchor.constraint(equalTo: occupationLabel.bottomAnchor, constant: 10),
            occupationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            occupationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            starRatingView.topAnchor.constraint(equalTo: occupationTextField.bottomAnchor, constant: 20),
            starRatingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: starRatingView.bottomAnchor, constant: 50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
