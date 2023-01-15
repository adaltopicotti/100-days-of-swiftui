import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

//    We call the code inside the braces the loop body
//    We call one cycle through the loop body a loop iteration.
//    We call os the loop variable. This exists only inside the loop body, and will change to a new value in the next loop iteration.


//    I should say that the name os isn’t special – we could have written this instead:
for name in platforms {
    print("Swift works great on \(name).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * 1)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    
//    Using print() by itself, with no text or value being passed in, will just start a new line. This helps break up our output so it looks nicer on the screen.
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)
