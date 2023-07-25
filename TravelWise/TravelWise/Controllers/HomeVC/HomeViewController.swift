//
//  HomeViewController.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
import MultiSlider
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var userData = UserData()
    
    // MARK: - UI Elements
    
    private let interestsLabel: UILabel = {
        let label = UILabel()
        label.text = "Interests:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let interestsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let interestsData = ["Sports", "Culture", "Nature", "Technology", "Food", "Travel", "Party", "Sight", "Sea", "Ocean", "Beach zones"]
    private var selectedInterests: [String] = []
    
    private let budgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Budget:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let housingLabel: UILabel = {
        let label = UILabel()
        label.text = "Preferred Housing:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let occupationLabel: UILabel = {
        let label = UILabel()
        label.text = "Occupation:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var interestsCategoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let budgetSlider: MultiSlider = {
        let slider = MultiSlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.orientation = .horizontal
        slider.value = [0, 100] // Значения по умолчанию для начального диапазона
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let housingSegmentedControl: UISegmentedControl = {
        let items = ["Apartment", "House", "Hotel", "Villa"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let occupationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your occupation"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Получить рекомендацию", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        interestsCollectionView.dataSource = self
        interestsCollectionView.delegate = self
        interestsCollectionView.register(InterestCollectionViewCell.self, forCellWithReuseIdentifier: "InterestCell")
        saveButton.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        setupUI()
    }
    
    // MARK: - Actions
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        collectUserData()
        printCollectedData()
        nextVC()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(interestsLabel)
        view.addSubview(interestsCollectionView)
        view.addSubview(interestsCategoriesStackView)
        view.addSubview(budgetLabel)
        view.addSubview(budgetSlider)
        view.addSubview(housingLabel)
        view.addSubview(housingSegmentedControl)
        view.addSubview(occupationLabel)
        view.addSubview(occupationTextField)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            interestsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            interestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            interestsCollectionView.topAnchor.constraint(equalTo: interestsLabel.bottomAnchor, constant: 20),
            interestsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            interestsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            interestsCollectionView.heightAnchor.constraint(equalToConstant: 200)
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
            housingSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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
            saveButton.topAnchor.constraint(equalTo: occupationTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func nextVC() {
        let nextViewController = RecommendationViewController()
        present(nextViewController, animated: true)
    }
    private func collectUserData() {
        userData.interests = selectedInterests
        let minValue = Int(budgetSlider.value[0])
        let maxValue = Int(budgetSlider.value[1])
        userData.budget = [minValue, maxValue]
        
        let selectedHousingIndex = housingSegmentedControl.selectedSegmentIndex
        userData.preferredHousing = PreferredHousing(rawValue: selectedHousingIndex) ?? .apartment
        
        userData.occupation = occupationTextField.text
    }
    
    private func printCollectedData() {
        print("interests: \(userData.interests)")
        print("Budget: \(userData.budget)")
        print("Preferred Housing: \(userData.preferredHousing.rawValue)")
        print("Occupation: \(userData.occupation ?? "N/A")")
        
        // Additional code to print the selected interests
        print("Selected Interests:")
        for selectedInterest in selectedInterests {
            print(selectedInterest)
        }
    }
}
struct UserData {
    var interests: [String] = []
    var budget: [Int] = []
    var preferredHousing: PreferredHousing = .apartment
    var occupation: String?
}


// Enum to represent preferred housing types
enum PreferredHousing: Int {
    case apartment
    case house
    case hotel
    case villa
}

// Helper extension to safely access an array element
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestsData.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interest = interestsData[indexPath.item]
        let textWidth = collectionView.bounds.width - 20 // Adjust the width as needed
        let textHeight = interest.height(withConstrainedWidth: textWidth, font: UIFont.systemFont(ofSize: 17)) // Use the appropriate font size
        return CGSize(width: textWidth, height: textHeight + 20) // Add some extra height for padding
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        let interest = interestsData[indexPath.item]
        cell.configure(with: interest)
        
        // Set the isSelectedItem property based on the selectedInterests array
        cell.isSelectedItem = selectedInterests.contains(interest)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedInterest = interestsData[indexPath.item]
        
        if selectedInterests.contains(selectedInterest) {
            // If the interest is already in selectedInterests, remove it to deselect the cell
            selectedInterests.removeAll { $0 == selectedInterest }
        } else {
            // If the interest is not in selectedInterests, add it to select the cell
            selectedInterests.append(selectedInterest)
        }
        
        // Reload the selected cell to update its appearance
        collectionView.reloadItems(at: [indexPath])
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
