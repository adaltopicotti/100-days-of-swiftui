import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers

struct Player {
    let name: String
    let number: Int
    
    // no "func" keyword - no "return" indicator
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
        
        // self.  to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.
    }
}

let player = Player(name: "Megan R")
print(player.number)


