import Foundation

/*:
 # Property Wrapper
 
 Swift 5.1부터 도입이 되었으며, class와 structure의 구현부에 getter, setter, computed property code의 중복을 줄이는 방법을 제공한다.
*/

@propertyWrapper
struct ToUpper {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Contact {
    @ToUpper var name: String
    @ToUpper var city: String
    @ToUpper var country: String
}
var contact = Contact(name: "Test", city: "San Francisco", country: "America")
print("\(contact.name), \(contact.city), \(contact.country)")

@propertyWrapper
struct MinMaxValue<V: Comparable> {
    var value: V
    var min: V
    var max: V
    
    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct TestString {
    @MinMaxValue(min: "Apple", max: "Orange") var value: String = ""
}
var test1 = TestString()
test1.value = "Banana"
print(test1.value)
test1.value = "Pear"
print(test1.value)

struct TestDate {
    @MinMaxValue(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())!) var value: Date = Date()
}
var test2 = TestDate()
print(test2.value)
test2.value = Calendar.current.date(byAdding: .day, value: 10, to: Date())!
print(test2.value)
test2.value = Calendar.current.date(byAdding: .month, value: 2, to: Date())!
print(test2.value)

struct TestInt {
    @MinMaxValue(min: 100, max: 200) var value: Int = 100
}
var test3 = TestInt()
test3.value = 50
print(test3.value)
test3.value = 150
print(test3.value)
test3.value = 250
print(test3.value)
