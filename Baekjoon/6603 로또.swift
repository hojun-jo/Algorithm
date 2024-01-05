var inputs = [[String]]()
var stack = [String]()
var using = Set<Set<String>>()
var result = String()

while var input = readLine()?.split(separator: " ").map(String.init) {
    if input == ["0"] { break }
    input.removeFirst()
    inputs.append(input)
}

for i in 0...inputs.count - 1 {
    backtracking(i)
    result += "\n"
}
print(result)

func backtracking(_ index: Int) {
    guard stack.count < 6 else {
        result += "\(stack.joined(separator: " "))\n"
        return
    }
    
    let last = stack.last ?? "0"
    
    for input in inputs[index] {
        if Int(input)! < Int(last)! { continue }
        
        stack.append(input)
        let stackSet = Set(stack)
        
        guard using.contains(stackSet) == false else {
            stack.removeLast()
            continue
        }
        
        using.insert(stackSet)
        backtracking(index)
        using.remove(stackSet)
        stack.removeLast()
    }
}
