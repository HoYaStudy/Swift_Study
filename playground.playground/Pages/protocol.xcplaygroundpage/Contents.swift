/*:
 # Protocol
 
 Class가 충족해야할 최소한의 요구사항을 정의하는 규칙들의 집합을 `protocol`이라고 한다.
*/

protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hello " + name
    }
}

var testInstance = MyClass(name: "HoYa")
print(testInstance.buildMessage())

/*:
 ## Opaque Return Type
 
 Concrete return type을 지정하는 대신 opaque return type을 사용하면 지정된 protocol을 따르는 모든 type이 반환될 수 있다.
*/

func doubleFunc1(value: Int) -> some Equatable {
    value * 2
}

func doubleFunc2(value: String) -> some Equatable {
    value + value
}

print(doubleFunc1(value: 10))
print(doubleFunc2(value: "Hello"))
