import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-provide-default-values-for-parameters



//    func printTimesTables(for number: Int, end: Int) {
//        for i in 1...end {
//            print("\(i) x \(number) is \(i * number)")
//        }
//    }
//
//    printTimesTables(for: 5, end: 20)

// That prints any times table, starting at 1 times the number up to any end point.
// That number is always going to change based on what multiplication table we want,
// but the end point seems like a great place to provide a sensible default – we might want to count up to 10 or 12 most of the time,
// while still leaving open the possibility of going to a different value some of the time.

// To solve this problem, Swift lets us specify default values for any or all of our parameters.
// In this case, we could set end to have the default value of 12, meaning that if we don’t specify it 12 will be used automatically.

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 5)

// Notice how we can now call printTimesTables() in two different ways:
// we can provide both parameters for times when we want it,
// but if we don’t – if we just write printTimesTables(for: 8) – then the default value of 12 will be used for end.

//  Swift gives arrays just enough memory to hold their items plus a little extra so they can grow a little over time
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
//characters.removeAll() remove all items, then free up all the memory that was assigned to the array
characters.removeAll(keepingCapacity: true) // remove all items, while also keeping the previous capacity
print(characters.count)
