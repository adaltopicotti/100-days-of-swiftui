import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/how-to-limit-access-to-internal-data-using-access-control

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


// This is called access control, because it controls how a struct’s properties and methods can be accessed from outside the struct.

//    Swift provides us with several options, but when you’re learning you’ll only need a handful:
//
//    Use private for “don’t let anything outside the struct use this.”
//    Use fileprivate for “don’t let anything outside the current file use this.”
//    Use public for “let anyone, anywhere use this.”
//


// There’s one extra option that is sometimes useful for learners, which is this: private(set). This means “let anyone read this property, but only let my methods write it.” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.

// In this case, I think private(set) is the best choice for funds: you can read the current bank account balance at any time, but you can’t change it without running through my logic.

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)


if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
