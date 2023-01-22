import Cocoa

enum GearError: Error {
    case outOfRange
}

struct Car {
    let model = "Kwid"
    let seats = 5
    private(set) var gear = 1
    
    mutating func gearUp() throws {
        if gear < 10 {
            gear += 1
        } else {
            throw GearError.outOfRange
        }
    }
    
    mutating func gearDown() throws {
        if gear > 1 {
            gear -= 1
        } else {
            throw GearError.outOfRange
        }
    }
}

var car = Car()
print(car.gear)
