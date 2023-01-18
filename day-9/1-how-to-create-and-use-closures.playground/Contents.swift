import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-closures



func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// When you're copying a function, you don't write the parentheses after it - it's "var greetCopy = greetUser"
// and not "var greetCopy = greetUser()". If you put the parentheses there you are calling the function and assigning
// its retur value back to something else.

// We can skip creating a separete function, and just assign the functionality directly to a constat or variable
//    let sayHello = {
//        print("Hi there!")
//    }
//
//    sayHello()

// Swift gives this the grandiose name "closure expression", wich is a fancy way to saying we just created a closure
// - a chunk of code we can pass around and call whenever we want.
// This one doesn’t have a name, but otherwise it’s effectively a function that takes no parameters and doesn’t return a value.

// If you want the closure to accept parameters, they need to be written in a special way.
// You see, the closure starts and ends with the braces
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

// "in" keyword is used to mark the end of the parameters and return type - everything after that is the body of the closure itself.

var greetCopy2: () -> Void = greetUser

// 1 - empty parentheses marks a function that takes no parameters
// 2 - The arrow means just what it means when creating a function: we're about to declare the return type for the function
// 3 - "Void" means "nothing" - this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

print(sayHello("Taylor"))


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
// sorted() actually allows us to pass in a custom sorting function to control exactly that.
// This function must accept two strings, and return true if the first string should be sorted before the second,
// or false if the first string should be sorted after the second.

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzane" {
        return false
    }
    
    return name1 < name2
}

//    let captainFirstTeam = team.sorted(by: captainFirstSorted)
//    print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzane" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)

