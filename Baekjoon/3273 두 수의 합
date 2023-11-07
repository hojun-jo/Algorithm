let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = Int(readLine()!)!
numbers.sort()

var result = 0
var firstPointer = 0
var endPointer = numbers.count - 1

while firstPointer != endPointer {
    if numbers[firstPointer] + numbers[endPointer] == x {
        endPointer -= 1
        result += 1
    } else {
        if numbers[firstPointer] + numbers[endPointer] < x {
            firstPointer += 1
        } else {
            endPointer -= 1
        }
    }
}

print(result)
