import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map(String.init)
    let numbersCount = numbers.count
    var numberString = String()
    var stack = [Int]()
    var using = Set<Int>()
    var primeNumbers = Set<Int>()
    
    func backtracking() {
        guard stack.count <= numbersCount else { return }
        
        for i in 0..<numbersCount {
            guard !using.contains(i) else { continue }
            stack.append(i)
            using.insert(i)
            
            numberString += numbers[stack.last!]
            let number = Int(numberString) ?? 0
            if isPrime(number) {
                primeNumbers.insert(number)
            }
            
            backtracking()
            
            numberString.removeLast()
            
            using.remove(i)
            stack.removeLast()
        }
    }
    
    backtracking()
    
    return primeNumbers.count
    
}

func isPrime(_ number: Int) -> Bool {
    guard number > 1 else { return false }
    
    var i = 2
    while i*i <= number {
        if number % i == 0 {
            return false
        }
        i += 1
    }
    
    return true
}
