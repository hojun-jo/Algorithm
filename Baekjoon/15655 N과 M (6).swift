let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map(String.init)
var stack = [String]()
var using = Set<Set<String>>()
var result = String()

backtracking()
print(result)

func backtracking() {
    guard stack.count < m else {
        result += "\(stack.joined(separator: " "))\n"
        return
    }
    
    for number in numbers {
        stack.append(number)
        let stackSet = Set(stack)
        
        guard using.contains(stackSet) == false else {
            stack.removeLast()
            continue
        }
        
        using.insert(stackSet)
        backtracking()
        stack.removeLast()
    }
}
