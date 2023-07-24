//
//  RealmLoginViewModel.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

final class RealmLoginViewModel {
    let realmManager: RealmManager 
    
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
    }
//MARK: - User login and password verification
    func loginUser(emailOrPhone: String, password: String, completion: @escaping (Bool) -> Void) {
        if let user = realmManager.findUserByEmailOrPhoneNumber(emailOrPhoneNumber: emailOrPhone) {
            if user.password == password {
                completion(true)
            } else {
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}
