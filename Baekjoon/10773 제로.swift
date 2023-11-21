let n = Int(readLine()!)!
var stack = [String]()

for i in 1...n {
    let input = readLine()!
    switch input {
    case "0":
        stack.removeLast()
    default:
        stack.append(input)
    }
}

print(stack.reduce(0) { $0 + Int($1)! })
