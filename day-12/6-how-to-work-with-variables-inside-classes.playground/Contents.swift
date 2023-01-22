import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-work-with-variables-inside-classes

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)
