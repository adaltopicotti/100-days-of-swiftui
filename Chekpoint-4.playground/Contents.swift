import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4

enum SqrtError: Error {
    case noRoot, outOfBounds
}

func calculateSqrt(number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SqrtError.outOfBounds
    }
    
    var sqrt = 0
    for i in 1...number {
        if i*i == number {
            sqrt = i
        }
    }
    if sqrt == 0 {
        throw SqrtError.noRoot
    }
    
    return sqrt
}



do {
    let sqrt = try calculateSqrt(number: 16)
    print(sqrt)
} catch SqrtError.noRoot {
    print("No root found")
} catch SqrtError.outOfBounds {
    print("Out of bounds")
} catch {
    print("There was an error \(error.localizedDescription)")
}

