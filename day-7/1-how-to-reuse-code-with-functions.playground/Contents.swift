import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-reuse-code-with-functions

print("Welcome to my app!")
print("By default This prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")

// "func" is a keyword marks the start of a function
// We're naming the function "showWelcome". This can be any name you want.
// The body of the function s contained within the open and close braces, just like the body of loops and the body of conditions
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// Those () are used with functions. They are used when you create the function, as you can see above,
// but also when you call the function - when you ask Swift to run its code.
// We can call our function like this:
showWelcome()

// Those parentheses is where we add configuration options for our functions
// We get to pass in data that customizes the way the functions works, so the function becomes more flexible
let number = 139
if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}
// "isMultiple(of: )" is a function that belongs to integers.
// If it didn't allow any kind of customization, it just wouldn't mae sense - is it a multiple of what?

let roll = Int.random(in: 1...20)
// Again, "random()" is a function, and the "(in: 1...20)" part marks configuration options - without that
// we'd have no control over the range of our random numbers, which would be significantly less useful.


// We can make our own functions that are open to configuration, all by putting extra code in between
// the parentheses when we create our function.
// This should be given a single integer, such as 8, and calculate the multiplication tables for that from 1 through 12.
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// When printTimesTables() is caled, we need to explicity write the "number: 5" - we need to write the parameter name as part of the function call.
// This isn't common in other languages, but it's really helpful in Swift as a reminder of what each paramter does.
// This naming of parameters becomes even more important when you have multiple parameters.
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

