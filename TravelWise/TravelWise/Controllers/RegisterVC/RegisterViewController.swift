//
//  RegisterViewController.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    private let realmManager = RealmManager()
    private let registerViewModel = RegisterViewModel()
    private let firstNameLabel: RegisterLabel = {
        let label = RegisterLabel(text: StaticRegisterVC.name)
        return label
    }()
    
    private let firstNameTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticRegisterVC.enterName)
        return textField
    }()
    
    private let lastNameLabel: RegisterLabel = {
        let label = RegisterLabel(text: StaticRegisterVC.lastName)
        return label
    }()
    
    private let lastNameTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticRegisterVC.enterLastName)
        return textField
    }()
    
    private let phoneNumberLabel:  RegisterLabel = {
        let label = RegisterLabel(text: StaticRegisterVC.numberPhone )
        return label
    }()
    
    private let phoneNumberTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticRegisterVC.enterPhoneNumber)
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private let emailLabel: RegisterLabel = {
        let label = RegisterLabel(text: StaticRegisterVC.mail)
        return label
    }()
    
    private let emailTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticRegisterVC.enterMail)
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordLabel: RegisterLabel = {
        let label = RegisterLabel(text: StaticRegisterVC.password)
        return label
    }()
    
    private let passwordTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: StaticRegisterVC.enterPassword)
        textField.isSecureTextEntry = true
        return textField
    }()
    private let registerButton: LoginButton = {
        let button = LoginButton(title: StaticRegisterVC.registerButton)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    private let bacgroundCornerView: RoundedCornerView = {
        let view = RoundedCornerView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var backgroundImage: BackgroundImageView = {
        let backgroundImageView = BackgroundImageView()
        return backgroundImageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - #selector Register users
extension RegisterViewController {
    @objc func handleRegistration() {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            AlertHelper.showAlert(in: self, withTitle: StaticRegisterVC.error, message: StaticRegisterVC.allFields)
            return
        }
        
        let realmViewModel = RealmRegisterViewModel(realmManager: realmManager)
        
        let registrationSuccess = realmViewModel.registerUser(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, password: password)
        if registrationSuccess {
            let homeViewController = HomeViewController()
            homeViewController.modalPresentationStyle = .fullScreen
            homeViewController.isModalInPresentation = true
            present(homeViewController, animated: true, completion: nil)
        } else {
            AlertHelper.showAlert(in: self, withTitle: StaticRegisterVC.error, message: StaticRegisterVC.registration)
        }
    }
}

//MARK: - setupUI()
private extension RegisterViewController {
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField, lastNameLabel, lastNameTextField, phoneNumberLabel, phoneNumberTextField, emailLabel, emailTextField, passwordLabel, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        view.backgroundColor = MainColor.color
        
        view.addSubview(bacgroundCornerView)
        view.addSubview(backgroundImage)
        bacgroundCornerView.addSubview(stackView)
        bacgroundCornerView.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            bacgroundCornerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bacgroundCornerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            bacgroundCornerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bacgroundCornerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
