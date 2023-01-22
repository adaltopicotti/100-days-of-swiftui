import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
}

class Dog: Animal {
    func speak() {
        print("Au")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Miau")
    }
}

let cat = Cat(legs: 4, isTame: false)
cat.speak()

