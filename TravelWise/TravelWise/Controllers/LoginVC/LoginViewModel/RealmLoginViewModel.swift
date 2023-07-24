//
//  RealmLoginViewModel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

final class RealmLoginViewModel {
    let realmManager: RealmManager // Add this property to hold the RealmManager instance
    
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
    }
    func loginUser(emailOrPhone: String, password: String, completion: @escaping (Bool) -> Void) {
        if let user = realmManager.findUserByEmailOrPhoneNumber(emailOrPhoneNumber: emailOrPhone) {
            if user.password == password {
                completion(true) // Вход успешен
            } else {
                completion(false) // Неверный пароль
            }
        } else {
            completion(false) // Пользователь не найден
        }
    }
}
