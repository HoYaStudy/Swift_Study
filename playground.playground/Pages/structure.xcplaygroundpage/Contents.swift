/*:
 # Structure
 
 Class처럼 structure도 data와 기능을 재사용할 수 있는 객체로 캡슐화하는 방법을 제공한다.
*/
/*:
 ## Structure vs Class
 
 1. Structure instance는 value type이고, class instance는 reference type이다. 즉, structure instance가 복사되거나 전달될 때, instance의 실제 복사본이 생기면서원본 객체가 갖고 있던 모든 data를 그대로 복사해서 갖게된다. 다시 말해, 복사본은 원본과는 별개인 자신만의 data를 갖는다.
 2. Structure는 상속이나 subclass를 지원하지 않는다.
 3. `deinit` method를 포함할 수 없다.
 4. Run-time에 instance의 유형을 식별할 수 없다.
*/

struct TestStructure {
    var value: String
    
    init(value: String) {
        self.value = value
    }
}

let testInstance1 = TestStructure(value: "Test")
var testInstance2 = testInstance1
testInstance2.value = "Modifying"
print(testInstance1.value)
print(testInstance2.value)
