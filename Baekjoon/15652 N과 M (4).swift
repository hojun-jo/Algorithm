let input = readLine()!.split(separator: " ").map { Int($0)! }
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
    
    let last = Int(stack.last ?? "0")!
    
    for number in 1...n {
        if last <= number {
            stack.append(String(number))
            backtracking()
            stack.removeLast()
        }
    }
}
