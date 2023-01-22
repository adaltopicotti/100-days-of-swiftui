import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-opaque-return-types


func getRandomNumber() -> some Equatable {
    Double.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber()
print(num)
