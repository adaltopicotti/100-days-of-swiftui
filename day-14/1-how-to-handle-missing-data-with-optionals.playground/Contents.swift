import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-missing-data-with-optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]


// We then attempt to read the value attached to the key “Peach”, which doesn’t exist,
// and we haven’t provided a default value to send back in place of missing data.
let peachOpposite = opposites["Peach"]

// Swift’s solution is called optionals, which means data that might be present or might not.
// They are primarily represented by placing a question mark after your data type,
// so in this case peachOpposite would be a String? rather than a String.

// Well, here’s the clincher: Swift likes our code to be predictable, which means it won’t let us use data that might not be there. In the case of optionals, that means we need to unwrap the optional in order to use it – we need to look inside the box to see if there’s a value, and, if there is, take it out and use it.

// Swift gives us two primary ways of unwrapping optionals, but the one you’ll see the most looks like this:

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

if let number = number {
    print(square(number: number))
}
// What’s happening here is that we’re temporarily creating a second constant of the same name,
// available only inside the condition’s body.
// This is called "shadowing, and it’s mainly used with optional unwraps like you can see above.
