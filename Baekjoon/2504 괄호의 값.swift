import Foundation

let input = readLine()!
    .replacingOccurrences(of: "()", with: "2")
    .replacingOccurrences(of: "[]", with: "3")
    .map(String.init)
var stack = [String]()
var result = 0

loop: for char in input {
    switch char {
    case "(", "[", "2", "3":
        stack.append(char)
    default:
        let value = char == ")" ? 2 : 3
        let target = char == ")" ? "(" : "["
        var inner = 0
        
        while let last = stack.last,
              let lastInt = Int(last) {
            stack.removeLast()
            inner += lastInt
        }
        
        inner = inner == 0 ? value : inner * value
        
        if stack.last == target {
            stack.removeLast()
            stack.append(String(inner))
        } else {
            result = 0
            break loop
        }
    }
}

for num in stack {
    if let num = Int(num) {
        result += num
    } else {
        result = 0
        break
    }
}

print(result)
