/*:
 # Collection
*/
/*:
 ## Array
*/

// Type Inference
var array1 = ["apple", "banana", "carrot"]  // mutable
let array2 = ["apple", "banana", "carrot"]  // immutable

// Type Annotation
var array3: [String] = ["dragon fruit", "eggplant", "fig"]

// Empty Array
var array4 = [Int]()

// Array with Default value
var array5 = [String](repeating:"Empty", count: 10)

// Mixed Type (사용 시 run-time error에 주의해야한다.)
let array6: [Any] = ["Test", 10, 2.718281]

// Concatenate
let array7 = ["grape", "honeydew", "iceberg lettuce"]
let array8 = ["jackfruit", "kiwi", "lemon"]
var array9 = array6 + array7

// Append
array9.append("mango")
array9 += ["nectarine"]
array9 += ["onion", "pineapple", "quince"]

// Insert
array1.insert("dimsum", at: 3)

// Delete
array1.remove(at: 1)
print(array1)
array1.removeFirst()
print(array1)
array1.removeLast()
print(array1)

print(array2.count)
print(array2.isEmpty)
print(array2[1])
array3[2] = "cucumber"
print(array3)
print(array3.shuffled())
print(array3.randomElement()!)

for item in array6 {
    print(item)
}

/*:
 ## Dictionary
*/

// Type Annotation
var dict1: [String: String] = ["111-11111": "AAA", "222-22222": "BBB", "333-33333": "CCC", "444-44444": "DDD"]

// Type Inference
var dict2 = ["111-11111": "AAA", "222-22222": "BBB", "333-33333": "CCC", "444-44444": "DDD"]

// Empty Dictionary
var dict3 = [Int: String]()

// Dictionary Initialization with Sequence
let keys = ["111-11111", "222-22222", "333-33333", "444-44444"]
let values = ["AAA", "BBB", "CCC", "DDD"]
let dict4 = Dictionary(uniqueKeysWithValues: zip(keys, values))
print("dict4: ", dict4)
let dict5 = Dictionary(uniqueKeysWithValues: zip(1..., values))
print("dict5: ", dict5)

// Delete
dict2["333-33333"] = nil
print("dict2: ", dict2)
dict2.removeValue(forKey: "111-11111")
print("dict2: ", dict2)

print(dict1.count)
print(dict1["222-22222"]!)
print(dict1["555-5555", default: "Not Found"])
dict1["222-22222"] = "BBBBB"
print("dict1: ", dict1)
dict1.updateValue("CCCCC", forKey: "333-33333")
print("dict1: ", dict1)

for (id, title) in dict4 {
    print("ID: \(id), Title: \(title)")
}
