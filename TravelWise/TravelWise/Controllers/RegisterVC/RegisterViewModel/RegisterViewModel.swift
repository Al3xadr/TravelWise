//
//  RegisterViewModel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit
class RegisterViewModel {
    func isValidFirstName(_ firstName: String) -> Bool {
        return !firstName.isEmpty
    }
    
    func isValidLastName(_ lastName: String) -> Bool {
        return !lastName.isEmpty
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        return !phoneNumber.isEmpty && phoneNumber.count >= 10 && phoneNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6 && password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil && password.rangeOfCharacter(from: CharacterSet.letters) != nil
    }
    
}
