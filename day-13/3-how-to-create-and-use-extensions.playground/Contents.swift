import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-extensions

var quote = " The truth is rarely pure and never simple "
//    let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)


// create an extension for Strings
// return a new value
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // change a value directly, rather than return a new value
    mutating func trim() {
        self = self.trimmed()
    }
    
    // return array with String lines value
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}




let trimmed = quote.trimmed()

quote.trim()
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""


print(lyrics)
print(lyrics.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let tnow = Book(title: "The Name of the Wind", pageCount: 1300)
