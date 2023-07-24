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
            return false
        }
        realmManager.addUser(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, password: password)
        return true
    }
    
    private func isValidData(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty && !password.isEmpty
    }
}
