import UIKit

/*:
 # Data Type
*/
/*:
 ## **Integer** Data Type
 
 * Int8  / UInt8
 * Int16 / UInt16
 * Int32 / UInt32
 * Int64 / UInt64

 Apple은 `Int`를 사용하기를 권고하고 있고, 이는 platform에 맞게 적절히 설정될 것이다.
*/

print("Int8 Min = \(Int8.min), Int8 Max = \(Int8.max)")
print("Int16 Min = \(Int16.min), Int16 Max = \(Int16.max)")
print("Int32 Min = \(Int32.min), Int32 Max = \(Int32.max)")
print("Int64 Min = \(Int64.min), Int64 Max = \(Int64.max)")
print("UInt8 Min = \(UInt8.min), UInt8 Max = \(UInt8.max)")
print("UInt16 Min = \(UInt16.min), UInt16 Max = \(UInt16.max)")
print("UInt32 Min = \(UInt32.min), UInt32 Max = \(UInt32.max)")
print("UInt64 Min = \(UInt64.min), UInt64 Max = \(UInt64.max)")

/*:
 ## **Floating Point** Data Type
 
 * Float
 * Double
 
 기본 type은 `Double`이다.
*/
/*:
 ## **Boolean** Data Type
 
 * Boolean
    + true / false
*/
/*:
 ## **Character** Data Type
 
 `Swift`에서 character data type은 문자, 숫자, 문장 부호, 기호와 같은 하나의 문자를 저장하는 데 사용한다.  내부적으로 `grapheme cluster`의 형태로 저장된다. 또한, escape sequence라는 특수 문자도 포함될 수 있다.
 
 ### Escape Sequence
 
 * `\n` : newline
 * `\r` : Carriage Return
 * `\t` : tab
 * `\\` : backslash
 * `\"` : double quote
 * `\'` : single quote
 * `\u{nn}` : 1 byte unicode scalar
 * `\u{nnnn}` : 2 byte unicode scalar
 * `\u{nnnnnnnn}` : 4 byte unicode scalar
 > n is a hexadecimal number.
 
 `grapheme cluster`는 눈에 보이는 하나의 문자를 표현하기 위해 결합된 둘 이상의 unicode scalar로 구성된다.
*/

var varChar1 = "a"
var varChar2 = "1"
var varChar3 = "!"
var varChar4 = "\u{0058}"
var varChar5 = "\n"

/*:
 ## **String** Data Type
 
 `Swift`에서 문자열은 single quote를 사용할 수 없고, double qoute만 사용할 수 있다.
*/

var name = "Thomas"
var age = 38
var weight = 62
var msg = "Name: \(name), Age: \(age), Weight: \(weight)"   // String Interpolation
print(msg)
var multiline = """
This is a test string.
 This is a test string.
  This is a test string.
"""
print(multiline)

/*:
 ## **Tuple** Data Type
 
 여러 값을 임시로 하나로 grouping하는 data type이다.
*/

let tuple = (10, 3.14, "Test string")
print(tuple.2)
let (int, _, string) = tuple    // Ignore double
print("\(int), \(string)")

/*:
 ## **Optional** Data Type
 
 값이 할당되지 않은 상태인 `nil`을 포함할 수 있는 type 이다.
 
 `?` 기호를 사용하여 선언한다.
 
 Optional variable에 값이 할당되었다면 해당 값이 optional 내에서 wrapped되었다고 한다.
 
 Wrapped value를 사용할 때는 forced unwrapping이라는 개념으로 `!` 기호를 사용한다.
*/

var varInt: Int?
varInt = 7

// Method 1
if varInt != nil {
    print("Variable has a value")
} else {
    print("Variable doesn't have a value")
}

// Method 2 (Forced Unwrapping)
print(varInt!)  // varInt에 값이 없다면 error가 발생한다.

// Method 3 (Optional Binding)
if let temp = varInt {
    print(temp)
} else {
    print("Variable doesn't have a value")
}

// Method 4 (Forced Upwrapping Declaration)
var varDouble: Double!
varDouble = 3.14

if varDouble != nil {
    print("Variable has a value")
} else {
    print("Variable doesn't have a value")
}

/*:
 ## Type Casting
 
 Compiler가 어떤 값의 특정 type을 식별하지 못하는 경우가 발생하는 경우가 있다.  이럴 때 `as` keyword를 사용해서 의도하는 값의 type을 compiler에게 알려준다.
 
 ### Upcasting
 
 특정 class의 객체가 상위 class 중의 하나로 변형되는 것을 말한다.
 
 `as` keyword를 사용하며, 변환이 성공할 것이라고 compiler에게 알려줄 수 있으므로 `guaranteed conversion`이라고도 한다.
 
 ### Downcasting
 
 어떤 class에서 다른 class로 만드는 변환이 일어나는 것을 말한다. 보통 하위 class로 변환하게 된다.
 
 `as!` keyword를 사용하며, 유효하지 않은 변환 시도를 compiler가 잡아낼 것이라는 보장을 할 수 없다. 따라서 `forced conversion`이라고 한다.
*/

// Upcasting
let button: UIButton = UIButton()
let ctrl = button as UIControl

// Downcasting
let scrollView: UIScrollView = UIScrollView()
let textView = scrollView as! UITextView

// Safe Downcasting
if let textView = scrollView as? UITextView {
    print("Type casting succeeded. \(String(describing: textView.text))")
} else {
    print("Type casting failed.")
}

/*:
 ## Type Check
 
 `is` keyword를 사용하여 type check를 할 수 있다.
*/

if ctrl is UIButton {
    print("ctrl is an instance of UIButton")
}
