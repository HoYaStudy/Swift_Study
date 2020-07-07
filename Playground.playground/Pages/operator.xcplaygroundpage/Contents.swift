/*:
 # Operator
*/
/*:
 ## Assignment Operator
 
 * `=`
*/
/*:
 ## Arithmetic Operator
 
 * `-` : Unary
 * `+`
 * `-`
 * `*`
 * `/`
 * `%`
*/
/*:
 ## Complex Assignment Operator
 
 * `x += y`
 * `x -= y`
 * `x *= y`
 * `x /= y`
 * `x %= y`
*/
/*:
 ## Comparison Operator
 
 * `x == y`
 * `x > y`
 * `x >= y`
 * `x < y`
 * `x <= y`
 * `x != y`
*/
/*:
 ## Logical Operator
 
 * `!`
 * `&&`
 * `||`
*/
/*:
 ## Range Operator
 
 * `x...y ` : Closed range operator
 * `x..<y` : Half-open range operator
 * `x...` : One-sided range opertor
 * `...y` : One-sided range opertor
*/

print("3...7: ", terminator: "")
for x in 3...7 {
    print(x, terminator: " ")    // 3 4 5 6 7
}
print()
print("3..<7: ", terminator: "")
for x in 3..<7 {
    print(x, terminator: " ")    // 3 4 5 6
}
print()

/*:
 ## Ternary Operator

 * `? :`
*/

let x = 1
let y = 2
print(x > y ? x : y)

/*:
 ## Bit Operator
 
 * `~`
 * `&`
 * `|`
 * `^`
 * `<<`
 * `>>`
*/
/*:
 ## Complex Bit Operator
 
 * `&=`
 * `|=`
 * `^=`
 * `<<=`
 * `>>=`
*/
