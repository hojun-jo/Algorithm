let n = Int(readLine()!)!
var edges = Array(repeating: [Int](), count: n + 1)

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}

print(dfs() % 2 == 0 ? "No" : "Yes")

func dfs() -> Int {
    var stack = [Int]()
    var visited = Set<Int>()
    var depth = [Int : Int]()
    var count = 0
    
    stack.append(1)
    visited.insert(1)
    depth[1] = 0
    
    while let current = stack.popLast() {
        if current != 1, edges[current].count == 1 {
            count += depth[current]!
        }
        
        for next in edges[current] {
            guard visited.contains(next) == false else { continue }
            
            stack.append(next)
            visited.insert(next)
            depth[next] = depth[current]! + 1
        }
    }
    
    return count
}
