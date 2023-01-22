import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-8

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var state: String { get }
    
    func summary() -> Void
}

struct House: Building {
    var rooms: Int = 4
    var cost: Int = 120_000
    var state: String = "Paraná"
    
    func summary() {
        print("This house have \(rooms) rooms, costs \(cost) and stay in \(state).")
    }
}

struct Office: Building {
    var rooms: Int = 2
    var cost: Int = 90_000
    var state: String = "Santa Catarina"
    
    func summary() {
        print("This office have \(rooms) rooms, costs \(cost) and stay in \(state).")
    }
}

let house = House()
let office = Office()

house.summary()
office.summary()
