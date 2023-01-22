import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-get-the-most-from-protocol-extensions


// Self - type
// self - value
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())


struct User: Comparable {
    let name: String
    
    // lhs -  left hand side
    // rhs - right hand side
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}




let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)
