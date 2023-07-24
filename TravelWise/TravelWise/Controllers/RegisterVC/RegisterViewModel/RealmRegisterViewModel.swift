//
//  RealmRegisterViewModel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import Foundation
final class RealmRegisterViewModel {
    private let realmManager: RealmManager
    
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
    }
    
    func registerUser(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) -> Bool {
        guard isValidData(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, password: password) else {
            // One or more fields contain invalid data, handle the error
            return false
        }

        // Add the user to the Realm database
        realmManager.addUser(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, password: password)

        // Registration was successful, return true
        return true
    }
    
    private func isValidData(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) -> Bool {
        // Здесь вы можете добавить дополнительные проверки введенных данных, если необходимо
        return !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty && !password.isEmpty
    }
}
