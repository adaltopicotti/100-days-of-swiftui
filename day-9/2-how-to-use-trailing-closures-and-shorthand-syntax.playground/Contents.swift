import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-trailing-closures-and-shorthand-syntax

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzane" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)

// In this code, the function we provide to sorted() must provide two strings and return a Boolean,
// so why do we need to repeat ourselves in our closure?

// The answer is: we don’t. We don’t need to specify the types of our two parameters because they must be strings,
// and we don’t need to specify a return type because it must be a Boolean. So, we can rewrite the code to this:


let captainFirstTeam2 = team.sorted(by: { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzane" {
        return false
    }
    
    return a < b
})

//That’s already reduced the amount of clutter in the code, but we can go a step further:
// when one function accepts another as its parameter, like sorted() does,
// Swift allows special syntax called trailing closure syntax. It looks like this:

let captainFirstTeam3 = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzane" {
        return false
    }
    
    return a < b
}

// Rather than passing the closure in as a parameter, we just go ahead and start the closure directly
// – and in doing so remove (by: from the start, and a closing parenthesis at the end.
// Hopefully you can now see why the parameter list and in come inside the closure,
// because if they were outside it would look even weirder!

//Swift can automatically provide parameter names for us, using shorthand syntax. With this syntax we don’t even write name1,
// name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1,
// for the first and second strings respectively.

let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzane" {
        return false
    }
    
    return $0 < $1
}


let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
