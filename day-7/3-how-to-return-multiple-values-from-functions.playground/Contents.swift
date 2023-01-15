import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-return-multiple-values-from-functions

// To return a single value from a function, we write an arrow and a data type before our function's opening brace
func isUpperCase(string: String) -> Bool {
    string == string.uppercased()
}

// To return two or more values from a funcion, you could use an array
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

// That's problematic, beacause it's hard to remember what user[0] and user[1] are,
// and if we ever adjust the data in that array then user[0] and user[1] could end up being something else or
// perhaps not existing at all

// We could use a dictionary instead, but that has its own problems
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}
let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")

// Yes, we’ve now given meaningful names to the various parts of our user data,
// but look at that call to print() – even though we know both firstName and lastName will exist,
// we still need to provide default values just in case things aren’t what we expect.

// Both of these solutions are pretty bad, but Swift has a solution in the form of tuples.
// Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into a single variable,
// but unlike thos other options tuples have a fixed size and can have a variety of data types.

func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

// There are three things it's important to know when using tuples

// 1 - if you're returning a tuple from a function, Swift already knows the names you're giving each item int ethe tuple
// so you don't need to repeat them when using return.
func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// 2 - sometimes you'll find you're given tuples where the elements don't have names.
// When this happens you can access the tuple's elements using numerical indices starting from 0
func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}
let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")
// These numerical indices are also available with tuples that have named elements

// 3 - if a function returns a tuple you can actually pull the tuple apart into individual values if you want to
//    let user4 = getUser4()
//    let firstName = user4.firstName
//    let lastName = user4.lastName
//    print("Name: \(firstName) \(lastName)")

// However, rather than assinging the tuple to user, then copying individual values out of there,
// we can skip the first step - we can pull apart the return value from getUser() into two separate constants
let (firstName, lastName) = getUser4()
print("Name: \(firstName) \(lastName)")

// In fact, if you don’t need all the values from the tuple you can go a step further by using _ to tell Swift to ignore that part of the tuple:
// let (firstName, _) = getUser()
