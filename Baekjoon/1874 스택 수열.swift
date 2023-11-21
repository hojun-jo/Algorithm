let n = Int(readLine()!)!
var numbers = [Int]()

var stack = [Int]()
var result = String()

for _ in 1...n {
    numbers.append(Int(readLine()!)!)
}

var current = 1
for num in numbers {
    while current <= num {
        stack.append(current)
        result += "+\n"
        current += 1
    }
    
    if stack.last ?? 0 == num {
        stack.removeLast()
        result += "-\n"
    } else {
        result = "NO"
        break
    }
}

print(result)
