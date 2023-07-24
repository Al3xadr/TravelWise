//
//  RealmManager.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import RealmSwift
import Foundation
class RealmManager {
    private let realm: Realm

    init() {
        // Получаем экземпляр Realm
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to open Realm database: \(error)")
        }
    }

    func addUser(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) {
        let newUser = User()
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.phoneNumber = phoneNumber
        newUser.email = email
        newUser.password = password

        // Добавляем пользователя в базу данных Realm
        do {
            try realm.write {
                realm.add(newUser)
            }
        } catch {
            fatalError("Failed to add user to Realm database: \(error)")
        }
    }
    func getUsers() -> [User] {
        do {
            let realm = try Realm() // Получаем экземпляр Realm
            let users = realm.objects(User.self) // Получаем все объекты типа User из базы данных
            return Array(users) // Преобразуем Results<User> в обычный массив [User]
        } catch let error {
            print("Ошибка при получении пользователей из Realm: \(error)")
            return []
        }
    }
    func findUserByEmailOrPhoneNumber(emailOrPhoneNumber: String) -> User? {
        do {
            let realm = try Realm()
            // Ищем пользователя по email или номеру телефона с помощью запроса
            let predicate = NSPredicate(format: "email == %@ OR phoneNumber == %@", emailOrPhoneNumber, emailOrPhoneNumber)
            return realm.objects(User.self).filter(predicate).first
        } catch {
            print("Ошибка при получении данных из Realm: \(error)")
            return nil
        }
    }
}
