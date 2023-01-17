import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-errors-in-functions


// 1. Telling Swift about the possible errors that can happen.
// 2. Writing a function that can flag up errors if they happen.
// 3 Calling that function, and handling any errors that might happen.


// Example: If the user asks us to check how strong their passowrd is,
// we'll flag up a serious error if the password is too short or is obvious

// We need to start by defining the possible errors that might happen.
// This means making a new enum that builds on Swift's existing Error type

enum PasswordError: Error {
    case short, obvious
}

// That says there are two possible errors with password: short and obvious.

// Step two is to write a function that will trigger one of those errors.
// When an error is triggered - or thrown in Swift - we're saying something fatal went wrong with the function,
// and instead of continuing as normal it immediately terminates without sending back any value.

// In our case, we’re going to write a function that checks the strength of a password:
// if it’s really bad – fewer than 5 characters or is extremely well known – then we’ll throw an error immediately,
// but for all other strings we’ll return either “OK”, “Good”, or “Excellent” ratings.

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "GOOD"
    } else {
        return "Excellent"
    }
}

// The final step is to run the function and handle any errors that might happen.
// Swift Playgrounds are pretty lax about error handling because they are mostly meant for learning,
// but when it comes to working with real Swift projects you’ll find there are three steps:

// 1. Starting a block of work that might throw errors, using do.
// 2. Calling one or more throwing functions, using try.
// 3. Handling any thrown errors using catch.

let string = "12345"
print("Example 1")
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error")
}

// try - this must be written before calling all functions that might throw errors,
// and is a visual signal to developers that regular code execution will be interrupted if an error happens.

// When use "try", need to be inside a "do" block, and make sure you have one or more "catch" blocks able to handle any errors.
// In some circumstances we can use an alternative written as "try!" wich does not require "do" and "catch",
// but will crash your code if an error is thrown

// When it comes to catching errors, must always have a "catch" block that block that is able to handle every kind of error.

print("\nExample 2")
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error \(error.localizedDescription)")
}
// it’s common to read "error.localizedDescription" to see exactly what happened.
