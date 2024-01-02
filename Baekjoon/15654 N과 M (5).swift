let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var stack = [String]()
var using = Set<Int>()
var result = String()

backtracking()
print(result)

func backtracking() {
    guard stack.count < m else {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for number in numbers {
        guard using.contains(number) == false else { continue }
        
        stack.append(String(number))
        using.insert(number)
        backtracking()
        stack.removeLast()
        using.remove(number)
    }
}
