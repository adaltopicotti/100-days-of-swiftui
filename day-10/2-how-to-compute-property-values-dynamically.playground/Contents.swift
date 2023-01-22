import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-compute-property-values-dynamically


struct Employee {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken = 0
    
    // computed value
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationRemaining)
print(archer.vacationAllocated)

