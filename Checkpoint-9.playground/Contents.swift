import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-9

func randomNumbers(numbers: [Int]?) -> Int {
    guard let random = numbers?.randomElement() else {
        return Int.random(in: 1...100)
    }
    return random
}

print(randomNumbers(numbers: nil))
