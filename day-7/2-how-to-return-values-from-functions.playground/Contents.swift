import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-return-values-from-functions

let root = sqrt(169)
print(root)

// For return your own value from a function, we need to do two things:
// Write an arrow then a data type before function's opening brace, which tells Swift what kind of data will get sent back
// Use the return keyword to send back our data

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


// Let's try a more complex example:
// Do two strings contain the same letters, regardless of their order?
// This function should accept two string parameters, and return true if their letters are the same
// so, "abc" and "cab" should return true beacause they bouth contain one "a", one "b", and one "c".

func areLettersAreIndentical(string1: String, string2: String) -> Bool {
    let sorted1 = string1.sorted()
    let sorted2 = string2.sorted()
    
    return sorted1 == sorted2
}

print(areLettersAreIndentical(string1: "adalto", string2: "otlada"))

// Short way to do this function
//    func shortAreLettersAreIndentical(string1: String, string2: String) -> Bool {
//        return string1.sorted() == string2.sorted()
//    }
// We've told swift that this function must return a Boolean, and because there's only one line of code, in the function Swift knows that's the one that must return data.
// Because of this, when a function has only one line of code, we can remove the "return" keyword entirely
func shortAreLettersAreIndentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

// Let’s try a third example.
// Do you remember the Pythagorean theorem from school?
// It states that if you have a triangle with one right angle inside,
// you can calculate the length of the hypotenuse by squaring both its other sides,
// adding them together, then calculating the square root of the result

//    func pythagoras(a: Double, b: Double) -> Double {
//        let input = a * a + b * b
//        let root = sqrt(input)
//        return root
//    }

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

// There’s one last thing I want to mention before we move on: if your function doesn’t return a value,
// you can still use return by itself to force the function to exit early.
