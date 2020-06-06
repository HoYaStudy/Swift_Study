/*:
 # Variable and Constant
 
 `Swift`는 type safe programming language이다.
 
 즉, 변수의 type이 한 번 정해지면 다른 type의 data를 저장할 수 없다.
*/
/*:
 ## Variable
 `var` keyword를 사용하여 정의한다.
*/

var variable = 1

/*:
 ## Constant
 `let` keyword를 사용하여 정의한다.
*/

let constant = 2

/*:
 Variable과 constant의 data type을 지정하는 방법은 2가지가 있다.
 1. Type annotation
 2. Type interference
*/

// Type Annotation
var count1: Int = 1
let count2: Int = 2

// Type Interference
var msg1 = "Hello"
let msg2 = "Swift"

/*:
 `Type annotation`을 사용하여 상수를 정의할 때는 나중에 값을 할당할 수 있다.
 `Type interference`를 사용하여 상수를 정의할 때는 반드시 정의하는 시점에 값을 할당해야 한다.
*/

let test1: Int
test1 = 1
let test2 = 1
