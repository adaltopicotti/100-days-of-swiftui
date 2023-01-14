import Cocoa

// Array
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
let temperatures = [25.3, 28.2, 26.4]

// The position of an item in an array is commonly called its index
print(beatles[0])
print(numbers[1])
print(temperatures[2])


// We can use append() to add new items
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

// Swift won't let we mix two types together (ex: string and integer)


var scores = Array<Int>() // also can write like [Int]()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = Array<String>() // also can write like [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2) // will remove item at index 2 of the array "Ray"
print(characters.count)

// We can check whether an array contains a particular item by using contains()
let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

// We can sort an array using sorted()
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

// We can reverse an array by calling reversed()
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
