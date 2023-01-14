import Cocoa

// An enum – short for enumeration – is a set of named values we can create and use in our code

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// also we can write like this
// enum Weekday {
//    case monday, tuesday, wednesday, thursday, friday
// }

var day = Weekday.monday
day = Weekday.tuesday
day = .friday // Swift knows that .friday must refer to Weekday.tuesday because day must always be some kind of Weekday


