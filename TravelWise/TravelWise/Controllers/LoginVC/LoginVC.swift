//
//  LoginVC.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
final class LoginViewController: UIViewController, UITextFieldDelegate {
    private let validViewModel = ValidLoginVCViewModel()
    private let realmManager = RealmManager()
    private var realmLoginViewModel: RealmLoginViewModel?
    private let ballImage: ImageBall = {
        let image = ImageBall()
        return image
    }()
    
    private let emailOrPhoneNumberTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Почта или телефон:")
        return textField
    }()
    
    private let passwordTextField: LoginAndPasswordTextField = {
        let textField = LoginAndPasswordTextField(placeholder: "Пароль:")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let registrationButton: LoginButton = {
        let button = LoginButton(title: "Регистрация")
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: LoginButton = {
        let button = LoginButton(title: "Вход")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realmLoginViewModel = RealmLoginViewModel(realmManager: realmManager)

        setupUI()
        

        
    }
    
}

//MARK: - #selector button 
private extension LoginViewController {
    @objc func handleRegistration() {
        let registerVC = RegisterViewController()
        let navigationController = UINavigationController(rootViewController: registerVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func handleLogin() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.isModalInPresentation = true
        self.present(homeViewController, animated: true, completion: nil)
       /* guard let emailOrPhone = emailOrPhoneNumberTextField.text,
              let password = passwordTextField.text else {
            AlertHelper.showAlert(in: self, withTitle: "Ошибка", message: "Пожалуйста, заполните все поля")
            return
        }
        
        realmLoginViewModel?.loginUser(emailOrPhone: emailOrPhone, password: password)
        { [weak self] success in
            if success {
                let homeViewController = HomeViewController()
                homeViewController.modalPresentationStyle = .fullScreen
                homeViewController.isModalInPresentation = true
                self?.present(homeViewController, animated: true, completion: nil)
            } else {
                AlertHelper.showAlert(in: LoginViewController(), withTitle: "Ошибка", message: "Неверный пароль или пользователь не найден")
            }
        }*/
    }
}
//MARK: - setupUI()
private extension LoginViewController {
    private func setupUI() {
        view.backgroundColor = .white
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
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
