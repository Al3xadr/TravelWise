//
//  LoginVC.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit


class LoginViewController: UIViewController {
    private let ballImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ball")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let emailOrPhoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Электронная почта или номер телефона"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Регистрация", for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Вход", for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // Обработчик нажатия на кнопку "Регистрация"
    @objc private func handleRegistration() {
        // Добавьте здесь код для обработки регистрации нового пользователя
        print("registrator")
    }
    
    // Обработчик нажатия на кнопку "Вход"
    @objc private func handleLogin() {
        print("login")
        // Добавьте здесь код для обработки входа зарегистрированного пользователя
        // Получите данные из текстовых полей: emailOrPhoneNumberTextField.text и passwordTextField.text
    }
}
private extension LoginViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        // Добавляем элементы интерфейса на view
        view.addSubview(ballImage)
        view.addSubview(emailOrPhoneNumberTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registrationButton)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            ballImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            ballImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImage.widthAnchor.constraint(equalToConstant: 100),
            ballImage.heightAnchor.constraint(equalToConstant: 100),
        ])
        NSLayoutConstraint.activate([
            emailOrPhoneNumberTextField.topAnchor.constraint(equalTo: ballImage.bottomAnchor, constant: 50),
            emailOrPhoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailOrPhoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneNumberTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            ])
        NSLayoutConstraint.activate([
            registrationButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
