/*:
 # Function
 
 함수가 받는 매개변수는 기본적으로 상수로 취급된다.
*/

// No Parameter, No Return
func sayHello() {
    print("Hello Swift")
}
sayHello()

// Parameter, Return
func buildMessage(name: String, age: Int) -> String {
    "\(name) and \(age)"    // Can omit the return, because it has only one expression
}
print(buildMessage(name: "HoYa", age: 7))
_ = buildMessage(name: "Alice", age: 5)  // Ignore the return value

/*:
 ## Parameter Name
 
 함수 code 내에서 참조할 수 있는 매개변수 이름을 `local parameter name`이라고 하고, 함수가 호출될 때 참조되는 매개변수 이름을 `external parameter name`이라고 한다.
*/

// Without External Parameter Name
func buildMessage2(_ name: String, _ age: Int) -> String {
    "\(name) and \(age)"
}
print(buildMessage2("Brian", 9))

// With External Parameter Name
func buildMessage3(userName name: String, userAge age: Int) -> String {
    "\(name) and \(age)"
}
print(buildMessage3(userName: "Chris", userAge: 3))

/*:
 ## Default Paramter
*/

func buildMessage4(_ name: String = "NONAME", age: Int) -> String {
    "\(name) and \(age)"
}
print(buildMessage4(age: 2))

/*:
 ## Variadic Parameter
 
 `...`을 사용하여 0개 이상의 매개변수를 사용할 수 있다.
*/

func printString(_ strings: String...) {
    for string in strings {
        print(string)
    }
}
printString("one", "two", "three")

/*:
 ## In-Out Parameter
 
 매개변수는 기본적으로 상수지만, `inout` keyword를 사용하여 변수처럼 사용할 수 있으며, 함수의 호출이 끝난 후에도 그 값을 유지시킬 수 있다.
 
 함수 호출시에는 `&` 기호와 함께 변수를 넣어준다.
*/

func squaredValue(_ value: inout Int) -> Int {
    value *= value
    return value
}
var value = 10
print(squaredValue(&value))

/*:
 ## Return Tuple
*/

func sizeConverter(_ length: Float) -> (yards: Float, centimeters: Float, meters: Float) {
    let yards = length * 0.0277778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    return (yards, centimeters, meters)
}
let result = sizeConverter(20)
print(result)

/*:
 ## Function Parameter
*/

func inchToFeet(_ inch: Float) -> Float {
    return inch * 0.0833333
}

func inchToYard(_ inch: Float) -> Float {
    return inch * 0.0277778
}

let toFeet = inchToFeet
print("10 inches are \(toFeet(10)) feets")

func convertOutput(_ converterFunc: (Float) -> Float, value: Float) {
    let result = converterFunc(value)
    print("The result is \(result)")
}
convertOutput(toFeet, value: 10)
convertOutput(inchToYard, value: 10)

func decideFunction(_ feet: Bool) -> (Float) -> Float {
    if feet {
        return toFeet
    } else {
        return inchToYard
    }
}
convertOutput(decideFunction(true), value: 5)

/*:
 ## Closure
 
 `closure expression`은 독립적인 code block이다.
 
 `closure`는 함수나 closure expression과 같은 독립적인 code block과 code block 주변에 있는 하나 이상의 변수가 결합된 것을 말한다.
*/

// Closure Expression
let closureExpr = {
    print("This is closure expression")
}
closureExpr()

let closureExpr2 = {(_ x: Int, _ y: Int) -> Int in
    return x + y
}
print(closureExpr2(10, 20))

// Closure
func closure() -> () -> Int {
    var counter = 0
    func testFunc() -> Int {
        return counter + 10
    }
    return testFunc
}
let testClosure = closure()
print(testClosure())
