_ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let max = numbers.max()!
var primeNumbers = [Int]()
var arr = Array(repeating: true, count: max + 1)

arr[1] = false

for i in 2...max {
    var current = i + i
    while current <= max {
        arr[current] = false
        current += i
    }
}

for i in numbers {
    if arr[i] == true {
        primeNumbers.append(i)
    }
}

print(primeNumbers.count)
