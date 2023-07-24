//
//  LoginViewModel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
final class ValidLoginVCViewModel {
    var emailOrPhoneNumber: String = "aa@mail.ru"
    var password: String = "12345RU"
    
    //MARK: -  A function for checking the entered data in the mail or phone field.
    func isValidEmailOrPhoneNumber() -> Bool {
        return !emailOrPhoneNumber.isEmpty && (emailOrPhoneNumber.contains("@") || emailOrPhoneNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
    }
    
    //MARK: -  Function for checking the entered data in the password field
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
