let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var stack = [String]()
var result = String()

backtracking()
print(result)

func backtracking() {
    guard stack.count < m else {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for number in 1...n {
        stack.append(String(number))
        backtracking()
        stack.removeLast()
    }
}
