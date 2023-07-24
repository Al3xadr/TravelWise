//
//  RealmModelUsers.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import RealmSwift
import Foundation

class User: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var phoneNumber: String
    @Persisted var email: String
    @Persisted var password: String

    convenience init(firstName: String, lastName: String, phoneNumber: String, email: String, password: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.password = password
    }
}
