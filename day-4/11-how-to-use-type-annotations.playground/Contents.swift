import Cocoa

//let surname = "Lasso" // String
//var score = 0 // Int

let surname: String = "Lasso" // surname must be String
var score: Int = 0 // score must be Integer

let playerName: String = "Roy"
let luckNumber: Int = 13
let pi: Double = 3.131
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@adalto"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]() // use [Type]() for empty array
var cities: [String] = [] // other annotation for empty array
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

let username: String
// lots of complex logic
username = "@adalto"
// lots more complex logic
print(username)
