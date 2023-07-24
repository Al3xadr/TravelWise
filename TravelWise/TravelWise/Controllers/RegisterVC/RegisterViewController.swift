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
        let label = RegisterLabel(text: "Имя:")
        return label
    }()
    
    private let firstNameTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Введите ваше имя")
        return textField
    }()
    
    private let lastNameLabel: RegisterLabel = {
        let label = RegisterLabel(text:"Фамилия:")
        return label
    }()
    
    private let lastNameTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Введите вашу фамилию")
        return textField
    }()
    
    private let phoneNumberLabel:  RegisterLabel = {
        let label = RegisterLabel(text: "Номер телефона:")
        return label
    }()
    
    private let phoneNumberTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Введите ваш номер телефона")
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private let emailLabel:  RegisterLabel = {
        let label = RegisterLabel(text:"Электронная почта:")
        return label
    }()
    
    private let emailTextField:  LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Введите вашу электронную почту")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordLabel: RegisterLabel = {
        let label = RegisterLabel(text: "Пароль:")
        return label
    }()
    
    private let passwordTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder:"Введите ваш пароль")
        textField.isSecureTextEntry = true
        return textField
    }()
    private let registerButton: LoginButton = {
        let button = LoginButton(title: "Зарегестрироваться")
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        view.backgroundColor = .white
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
            AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Пожалуйста, заполните все поля")
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
            AlertHelper.showAlert(in: self, withTitle: "Error", message: "An error occurred during registration.")
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
        
        view.addSubview(stackView)
        view.addSubview(registerButton)
        
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
