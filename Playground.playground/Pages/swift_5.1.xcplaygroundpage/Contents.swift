/*:
 # Swift 5.1
*/
/*:
 ## Opaque Type (SE-0244)

 ```
 var body: some View { ... }
 ```
 위의 예에서 `some`이 opaque type에 관한 keyword로 property나 첨자, 함수 등의 return type에 한정적으로 사용되며, some 다음에 올 수 있는 type은 protocol, class, Any, AnyObject로 한정 된다.
 
 `some`을 빼면 2개의 error가 발생한다.
 * associatedtype을 가진 protocol을 사용할 때 type을 유추할 수 없어 발생.
 * 위로 인해 View protocol의 조건을 만족하지 않아서 발생.
 ```
 protocol View {
    associatedtype Body: View
    var Body: Self.Body { get }     // Body에 대한 type 정보가 필요
 }
 ```
 UIKit에서는 view의 설정을 바꾸거나 자식 view를 추가한다고 그 자신의 type이 바뀌는 것은 아니었지만, 구조체를 사용하고 generic을 적극적으로 활용하는 SwiftUI의 구현 방식에서는 view를 추가하거나 변경할 때마다 새로운 type이 만들어진다.
 
 Opague type은 concrete type을 반환하는 대신, type 정보를 숨기고 protocol에 대한 정보만 남긴 채 API를 사용할 수 있도록 도와준다.
 
 ```
 func myView1() -> Text {   // 항상 Text만 반환가능
     Text("Hello SwiftUI")
 }
 
 func myView2() -> some View {  // View protocol만 준수한다면 어떤 type이든 무관
    // Text("Hello SwiftUI")
    Image("Hello SwiftUI")
 }
 ```
 
 Opaque type은 generic을 반대로 적용하는 것 같은 개념이라, reverse generic으로도 불린다.
 
 Opaque type은 static type system에서만 불투명성이 유지되며, run-time에서는 type드러난다.
 ```
 protocol Animal {}
 struct Dog: Animal {
    var color = "brown"
 }
 let dog: some Animal = Dog()
 dog.color              // Compile Error!
 (dog as! Dog).color    // "brown"
 ```
*/
/*:
 ## Omit Return (SE-0255)

 Single expression이 사용된 함수에 대해 closure와 동일하게 return keyword를 생략할 수 있다.
*/

func sum(lhs: Int, rhs: Int) -> Int {
    lhs + rhs
}
print(sum(lhs: 1, rhs: 2))

/*:
 ## Identifiable Protocol (SE-0261)
 
 Identifiable protocol은 Hashable protocol을 준수하는 id property 하나만 가지는 단순한 protocol이다.
 
 ```
 public protocol Identifiable {
    associatedtype ID: Hashable
    var id: Self.ID { get }
 }
 ```
 
 Identifiable protocol은 AnyObject, 즉 참조 type에 한해 id property에 Object Identifier라는 구조체를 사용한다.
 
 ```
 extension Identifiable where Self: AnyObject {
    public var id: ObjectIdentifier { get }
 }
 ```
 
 이 경우 기본값으로는 memory 주소를 반환하게 된다.
 
 이 protocol이 적용된 참조 type은 `===` 연산자 외에 id를 통해서도 개체의 정체성을 식별할 수 있게 되며, ObjectIdentifier type을 대신해 임의의 type을 사용하는 것도 가능하다. 이 경우에는 참조 type의 id가 Hashable protocol을 충족하지 않아도 무방하다.
 */
