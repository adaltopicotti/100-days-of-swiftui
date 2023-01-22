import Cocoa


// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-structs

// the struct's name start with capital letter, that's the standard in swift

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year))by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// - Variables and constants that belong to structs are called properties.
// - Functions that belong to structs are called methods.
// - When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
// - When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).


struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // Any functions that change data belonging to the struct must be marked with a special "mutating" keyword
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Ops! There aren't enough days remaining.")
        }
    }
}

//We need to use "var" when trying call a mutating function. "let" is not allowed.
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters.

var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)


// Way back when I introduced Double for the first time, I explained that you can’t add an Int and a Double and instead need to write code like this:

let a = 1
let b = 2.0
let c = Double(a) + b

//Now you can see what’s really happening here: Swift’s own Double type is implemented as a struct, and has an initializer function that accepts an integer.
//
//Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.


// If our struct had these two properties

//    let name: String
//    var vacationRemaining = 14

// Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid:

//    let kane = Employee(name: "Lana Kane")
//    let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

//If you assign a default value to a constant property, that will be removed from the initializer entirely. To assign a default but leave open the possibility of overriding it when needed, use a variable property.
