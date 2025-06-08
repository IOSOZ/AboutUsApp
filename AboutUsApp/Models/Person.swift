import Foundation

struct Person {
    let name: String
    let surname: String
    let age: String
    let photo: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    init(name: String, surname: String, age: String, photo: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.photo = photo
    }
}

let personOleg = Person(name: "Олег", surname: "Зуев", age: "25", photo: "photo_Oleg")
let personSergey = Person(name: "Сергей", surname: "Макаров", age: "28", photo: "photo_Sergey")


let creators: [Person] = [personOleg, personSergey]

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
