let n = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").compactMap { Int($0)! }
var stack = [(Int, Int)]()

for i in 1...n {
    if stack.isEmpty {
        stack.append((i, towers[i - 1]))
        print(0, terminator: " ")
    } else {
        while stack.last?.1 ?? 0 < towers[i - 1] {
            stack.removeLast()
            
            if stack.isEmpty {
                stack.append((i, towers[i - 1]))
                print(0, terminator: " ")
            }
        }
        
        if stack.last?.1 ?? 0 > towers[i - 1] {
            print(stack.last!.0, terminator: " ")
            stack.append((i, towers[i - 1]))
        }
    }
}
