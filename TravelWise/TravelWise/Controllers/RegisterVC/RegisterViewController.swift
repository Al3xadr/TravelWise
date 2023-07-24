//
//  RegisterViewController.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

class RegisterViewController: UIViewController {
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

extension RegisterViewController {
    @objc func handleRegistration() {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            // Один из текстовых полей пустой, обработаем ошибку
            AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Пожалуйста, заполните все поля")
            return
        }
        
        let realmViewModel = RealmRegisterViewModel(realmManager: realmManager)
        
        let registrationSuccess = realmViewModel.registerUser(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, password: password)
        if registrationSuccess {
            let homeViewController = HomeViewController()
            homeViewController.modalPresentationStyle = .fullScreen
            homeViewController.isModalInPresentation = true // Запрещаем сворачивание контроллера свайпом
            present(homeViewController, animated: true, completion: nil)
        } else {
            // If there was an error during registration, show an alert
            AlertHelper.showAlert(in: self, withTitle: "Error", message: "An error occurred during registration.")
        }
    }
}

//MARK: - TextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func delegateTextField() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case firstNameTextField:
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let isValid = registerViewModel.isValidFirstName(updatedText)
            if !isValid {
                AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Введите корректное имя")
            }
        case lastNameTextField:
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let isValid = registerViewModel.isValidLastName(updatedText)
            if !isValid {
                AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Введите корректную Фамилию")
            }
        case phoneNumberTextField:
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let isValid = registerViewModel.isValidPhoneNumber(updatedText)
            if !isValid {
                AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Введите корректный номер")
            }
        case emailTextField:
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let isValid = registerViewModel.isValidEmail(updatedText)
            if !isValid {
                AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Введите корректный email")
            }
        case passwordTextField:
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let isValid = registerViewModel.isValidPassword(updatedText)
            if !isValid {
                AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Введите корректный пароль")
            }
        default:
            break
        }
        
        return true
    }
}

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
