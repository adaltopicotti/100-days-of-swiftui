import Cocoa

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

// Backslash before quotes to include quotes without finish the string
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Use 3 quotes at begining and 3 at the and for multilines string
let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))



