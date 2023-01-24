import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-unwrap-optionals-with-guard


//    var myVar: Int? = 3
//
//    if let unwrapped = myVar {
//        // Run if myVar has a value inside
//    }
//
//    guard let unwrapped = myVar else {
//        // Run if myVar doesn't have a value inside
//    }


// Swift requires you to use "return" if a "guard" check fails.
// if The optional you're unwrapping has a value, you can use it after the guard code finishes.

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}
