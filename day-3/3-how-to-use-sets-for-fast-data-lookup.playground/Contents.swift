import Cocoa

// Set is a group of data, they are similar to arrays, except you can't add duplicated items,
// and they don't store their data in particular order
let actors = Set([
"Denzel Washington",
"Tom Cruise",
"Nicolas Cage",
"Samuel L Jackson"
])

print(actors)

// Other important difference when adding items to a set is visible when you add items individually.
var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")
// We use insert(), when in array we use append()

print(people)
