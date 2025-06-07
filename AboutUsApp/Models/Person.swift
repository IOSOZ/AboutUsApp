//
//  Person.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 05.06.2025.
//

import Foundation


struct Person {
    let name: String
    let surname: String
    let age: String
    let photo: String
    
    var fullName: String {
        "(\(name) \(surname))"
    }
    
    init(name: String, surname: String, age: String, pet: String, photo: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.photo = photo
    }
}

struct User {
    let username: String
    let password: String
    static func getUser() -> User {
        User(
            username: "User",
            password: "Password"
        )
    }
}
