let n = Int(readLine()!)!
var numbers = [Int]()
var result = 0
var currentValue = Int.min
var currentCount = 1
var maxCount = 0

for _ in 1...n {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

for number in numbers {
    if currentValue == number {
        currentCount += 1
    } else {
        currentValue = number
        currentCount = 1
    }
    
    if currentCount > maxCount {
        maxCount = currentCount
        result = currentValue
    }
}

print(result)
