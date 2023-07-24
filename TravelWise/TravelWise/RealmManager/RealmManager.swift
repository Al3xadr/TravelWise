//
//  RealmManager.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import RealmSwift
import Foundation
final class RealmManager {
    private let realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to open Realm database: \(error)")
        }
    }
//MARK: - addUser()
    func addUser(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) {
        let newUser = User()
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.phoneNumber = phoneNumber
        newUser.email = email
        newUser.password = password
        do {
            try realm.write {
                realm.add(newUser)
            }
        } catch {
            fatalError("Failed to add user to Realm database: \(error)")
        }
    }
//MARK: - getUsers()
    func getUsers() -> [User] {
        do {
            let realm = try Realm()
            let users = realm.objects(User.self)
            return Array(users)
        } catch let error {
            print("Ошибка при получении пользователей из Realm: \(error)")
            return []
        }
    }
//MARK: - findUserByEmailOrPhoneNumber()
    func findUserByEmailOrPhoneNumber(emailOrPhoneNumber: String) -> User? {
        do {
            let realm = try Realm()
            let predicate = NSPredicate(format: "email == %@ OR phoneNumber == %@", emailOrPhoneNumber, emailOrPhoneNumber)
            return realm.objects(User.self).filter(predicate).first
        } catch {
            print("Ошибка при получении данных из Realm: \(error)")
            return nil
        }
    }
}
