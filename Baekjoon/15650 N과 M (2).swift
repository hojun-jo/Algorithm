let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var stack = [Int]()
var using = Set<Int>()
var result = String()

backtracking()
print(result)

func backtracking() {
    guard stack.count < m else {
        if stack == stack.sorted() {
            result += stack.map(String.init).joined(separator: " ") + "\n"
        }
        return
    }
    
    for number in 1...n {
        guard using.contains(number) == false else { continue }
        
        stack.append(number)
        using.insert(number)
        backtracking()
        using.remove(number)
        stack.removeLast()
    }
}
