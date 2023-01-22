import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-add-initializers-for-classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isEletric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isEletric)
    }
}

let teslaC = Car(isEletric: true, isConvertible: false)
