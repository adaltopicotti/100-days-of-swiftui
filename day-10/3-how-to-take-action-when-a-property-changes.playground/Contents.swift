import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-take-action-when-a-property-changes

// Swift lets us create property observers, which are special pieces of code that run when properties change. These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
//print("Score is now \(game.score)")
game.score -= 3
//print("Score is now \(game.score)")
game.score += 1

// If you want it, Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from.

// There’s also a willSet variant that runs some code before the property changes, which in turn provides the new value that will be assigned in case you want to take different action based on that.

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
