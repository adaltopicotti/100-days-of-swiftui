import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-customize-parameter-labels


// You’ve seen how Swift developers like to name their function parameters,
// because it makes it easier to remember what they do when the function is called.
// For example, we could write a function to roll a dice a certain number of times,
// using parameters to control the number of sides on the dice and the number of rolls:

func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

// Even if you came back to this code six months later, I feel confident that rollDice(sides: 6, count: 4) is prettyself-explanatory.

// Sometimes, though, these paramater names alre less helpful
let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

// When we call hasPrefix() we pass in the prefix to check for directly – we don’t say hasPrefix(string:) or, worse, hasPrefix(prefix:).

// When we're defining the parameters for a function we can actually add two names: one for use where the function is called,
// and one for use inside the function itself. hasPrefix() uses this to specify _ as the external name for its parameter,
// wich is Swift's  way of saying "ignore this" and causes there to be no external label for that parameter.

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string: string)

// If we add an underscore before the parameter name, we can remove the external parameter label
func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "HELLo, WORLD"
let result2 = isUppercase2(string2)

// The second problem with external parameter names is when they aren’t quite right – you want to have them,
// so _ isn’t a good idea, but they just don’t read naturally at the function’s call site.

//    func printTimesTables(number: Int) {
//        for i in 1...12 {
//            print("\(i) x \(number) is \(i * number)")
//        }
//    }
//
//    printTimesTables(number: 5)

// That code is valid Swift, and we could leave it alone as it is. But the call site doesn’t read well: printTimesTables(number: 5). It would be much better like this:

//    func printTimesTables(for: Int) {
//        for i in 1...12 {
//            print("\(i) x \(for) is \(i * for)")
//        }
//    }
//
//    printTimesTables(for: 5)

// That reads much better at the call site - you can literally say "print times table for 5" aloud,
// and it makes sense. But now we have invalid Swift: although "for" is allowed and reads great at the call site,
// it's not allowed inside the function
// An option is to write a second name there: one to use externally, and one to use internally.

func printTimesTalbes(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTalbes(for: 5)

// There are three things in there you need to look at closely:

// 1 - We write "for number: Int": the external name is "for", the internal name is "number", and it's of type "Int"
// 2 - When we call the function we use the external name for the parameter: printTimesTables(for: 5)
// 3 - Inside the function we use the internal name for the parameter: "print("\(i) x \(number) is \(i * number)")

// So, Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.
