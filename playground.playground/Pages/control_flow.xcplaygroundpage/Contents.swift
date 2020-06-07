/*:
 # Control Flow
*/
/*:
 ## Looping Control
 
 ### for-in
*/

for x in 1...5 {
    print("Current Value: \(x)")
}

var count = 0
for _ in 1...5 {
    count += 1
    if count > 3 {
        break
    }
}
print("Sum is \(count)")

/*:
 ### while
*/

var x = 0
while x < 10 {
    x += 1
}

/*:
 ### repeat-while
*/

var i = 10
repeat {
    i -= 1
    if i % 2 != 0 {
        continue
    }
    print("Current Value: \(i)")
} while i > 0

/*:
 ## Conditional Flow Control
 
 ### if-else if-else
*/

let y = 7
if y == 10 {
    print("y is 10")
} else if y == 9 {
    print("y is 9")
} else {
    print("y is less than 9")
}

/*:
 ### switch
*/

let value = 78
switch (value) {
case 0, 1, 2:
    print("First")
case 3...10:
    print("Second")
case 11..<70:
    print("Third")
    fallthrough     // Run continuously next case
case 70...100 where value % 2 == 0:
    print("Fourth")
default:
    break   // Nothing to do
}

/*:
 ### guard
*/

func multiplyByTen(value: Int?) {
    guard let num = value, num < 10 else {
        print("Number is greater than 10 or nil")
        return
    }
    let result = num * 10
    print(result)
}
multiplyByTen(value: 7)
multiplyByTen(value: 15)
multiplyByTen(value: nil)
