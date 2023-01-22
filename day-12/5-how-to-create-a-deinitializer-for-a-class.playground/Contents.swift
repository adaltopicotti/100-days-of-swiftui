import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-a-deinitializer-for-a-class

//    Just like initializers, you don’t use func with deinitializers – they are special.
//    Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//    Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//    We never call deinitializers directly; they are handled automatically by the system.
//    Structs don’t have deinitializers, because you can’t copy them.

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
