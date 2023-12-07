let input = readLine()!
var result = 0
var previous = Character(".")
var stack = [Character]()

for char in input {
    switch char {
    case "(":
        stack.append(char)
    default:
        if previous == "(" {
            stack.removeLast()
            result += stack.count
        } else {
            stack.removeLast()
            result += 1
        }
    }
    
    previous = char
}

print(result)
