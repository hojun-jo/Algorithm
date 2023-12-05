let n = Int(readLine()!)!
var result = 0

for _ in 1...n {
    let input = readLine()!
    var stack = [Character]()
    
    for character in input {
        if stack.last == character {
            stack.removeLast()
        } else {
            stack.append(character)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
