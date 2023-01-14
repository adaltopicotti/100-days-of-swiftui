import Cocoa

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)


// using + lets us add strings to strings, integers to integers, and decimals to decimals, but doesn’t let us add integers to strings
// We could ask Swift to treat the number like a string
let number = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon."

// or use string interpolation
let missionMessage2 = "Apollo \(number) landed on the moon."

print("5 x 5 is \(5 * 5)")
