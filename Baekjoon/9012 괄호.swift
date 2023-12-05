let n = Int(readLine()!)!
var result = String()

loop: for _ in 1...n {
    let input = readLine()!
    var stack = [Character]()
    
    for character in input {
        if character == "(" {
            stack.append(character)
        } else {
            if stack.last == "(" {
                stack.removeLast()
            } else {
                result += "NO\n"
                continue loop
            }
        }
    }
    
    if stack.isEmpty {
        result += "YES\n"
    } else {
        result += "NO\n"
    }
}

print(result)
