var result = String()

loop: while true {
    guard let input = readLine(),
        input != "." else {
        break
    }
    
    var stack = [Character]()
    
    for character in input {
        switch character {
        case "(", "[":
            stack.append(character)
        case ")":
            if stack.last == "(" {
                stack.removeLast()
            } else {
                result += "no\n"
                continue loop
            }
        case "]":
            if stack.last == "[" {
                stack.removeLast()
            } else {
                result += "no\n"
                continue loop
            }
        default:
            continue
        }
    }
    
    if stack.isEmpty {
        result += "yes\n"
    } else {
        result += "no\n"
    }
}

print(result)
