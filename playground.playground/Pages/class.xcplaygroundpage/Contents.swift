
/*:
 # Class
*/
/*:
 ## Property
 
 ### Stored Property
 
 상수나 변수에 담기는 값이다.
 
 ### Computed Property
 
 Set/Get 시점에 계산이나 logic에 따라 처리된 값이다.
 
 ### `Lazy` Property
 
 Property를 초기화 하는 방법은 몇가지가 있다.
 
 1. 직접 할당
 2. 생성자에서 할당
 3. closure를 이용하여 할당
 
 복잡한 closure의 경우 초기화 작업에 많은 resource와 시간이 들 수 있다. 이 때, `lazy` keyword를 앞에 불여주면 property에 최초로 접근할 때만 초기화를 한다.
 
 또한, lazy property는 반드시 `var` keyword로 선언되어야 한다.
*/
/*:
 ## Method

 ### Type Method

 Class level에서 동작한다.
 
 Method에 `class` keyword를 붙인다.
 
 ### Instance Method
 
 Instance level에서 동작한다.
*/
/*:
 ## `self`
 
 기본적으로 property와 method에 대한 참조를 default로 간주하므로 굳이 명시하지 않아도 된다.
 
 하지만, property나 method를 closure expression내에서 참조할 경우 반드시 `self`를 명시해야 한다.
 
 또한, 같은 이름 사용으로 code가 모호해질 때도 명시를 해줘야 한다.
*/

class BankAccount {
    var accountNumber: Int = 0      // Stored Property
    var accountBalance: Float = 0   // Stored Property
    var fees: Float = 25.00         // Stored Property
    var balanceLessFees: Float {    // Computed Property
        get {
            return accountBalance - fees
        }
        set(newBalance) {
            accountBalance = newBalance - fees
        }
    }
    
    // Constructor
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    // Destructor
    deinit {
        
    }
    
    // Type Method
    class func getMaxBalance() -> Float {
        return 100000.00
    }
    
    // Instance Method
    func displayBalance() {
        print("Number: \(accountNumber)")
        print("Current Balance: \(accountBalance)")
    }
}

var account1: BankAccount = BankAccount(number: 1234, balance: 57000.34)

print(account1.accountBalance)
account1.accountBalance = 3456.12
account1.displayBalance()

print(BankAccount.getMaxBalance())

print(account1.balanceLessFees)
account1.balanceLessFees = 9876.23
account1.displayBalance()

/*:
 ## Inheritance
 
 Class hierarchy의 최상단에 있는 class를 base class 또는 root class라고 한다.
 
 상속받은 class를  subclass 또는 child class라고 한다.
 
 하위 class가 상속받는 class를 super class 또는 parent class라고 한다.
 
 하나의 class는 하위 class를 얼마든지 가질 수 있고, 단 한개의 상위 class를 가질 수 있다. 이것이 single inheritance이다.
 
 >  초기화 과정에서 발생할 수 있는 잠재적인 문제를 피하기 위하여 상위 class의 init method는 항상 하위 class의 초기화 작업이 완료된 후에 호출되도록 해야 한다.
*/

class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float) {
        interestRate = rate
        super.init(number: number, balance: balance)
    }
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    // Method Overriding
    override func displayBalance() {
        super.displayBalance()
        print("Prevailing Interest Rate: \(interestRate)")
    }
}

let account2 = SavingsAccount(number: 777, balance: 7000.00, rate: 0.07)
print(account2.calculateInterest())
account2.displayBalance()

/*:
 ## Class Extension
 
 Swift class에 기능을 추가하는 방법 중 하나이다.
*/

extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let value: Double = 3.0
print(value.squared)
print(value.cubed)
