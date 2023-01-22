import Cocoa


// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-classes

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
