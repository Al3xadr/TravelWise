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
    
    private var lastCountryID: Int = 0

    // Function to generate a new unique countryID
    private func generateUniqueCountryID() -> Int {
        lastCountryID += 1
        return lastCountryID
    }
    
    // MARK: - addUser()
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
    
    // MARK: - getUsers()
    func getUsers() -> [User] {
        do {
            let users = realm.objects(User.self)
            print( users )
            return Array(users)
        } catch let error {
            print("Error while fetching users from Realm: \(error)")
            return []
        }
    }
    
    // MARK: - findUserByEmailOrPhoneNumber()
    func findUserByEmailOrPhoneNumber(emailOrPhoneNumber: String) -> User? {
        do {
            let predicate = NSPredicate(format: "email == %@ OR phoneNumber == %@", emailOrPhoneNumber, emailOrPhoneNumber)
            return realm.objects(User.self).filter(predicate).first
        } catch {
            print("Error while fetching data from Realm: \(error)")
            return nil
        }
    }

}
