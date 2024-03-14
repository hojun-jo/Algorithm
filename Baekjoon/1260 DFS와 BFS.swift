struct Queue<T> {
    private var q = [T]()
    private var head = 0
    
    var isEmpty: Bool {
        return q.count - head == 0
    }
    
    mutating func push(_ element: T) {
        q.append(element)
    }
    
    mutating func pop() -> T {
        head += 1
        return q[head - 1]
    }
}

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, startNode) = (nmv[0], nmv[1], nmv[2])
var degree = Array(repeating: [Int](), count: n + 1)
var stack = [Int]()
var q = Queue<Int>()
var visited = Set<Int>()
var result = String()

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    degree[input[0]].append(input[1])
    degree[input[1]].append(input[0])
}

degree = degree.map { $0.sorted() }

dfs1(startNode)
//dfs2(startNode)
result += "\n"
visited.removeAll()
bfs(startNode)
print(result)

func dfs1(_ node: Int) {
    stack.append(node)
    
    while !stack.isEmpty {
        let current = stack.removeLast()
        guard !visited.contains(current) else { continue }
        visited.insert(current)
        result += String(current) + " "
        
        for next in degree[current].reversed() {
            guard !visited.contains(next) else { continue }
            stack.append(next)
        }
    }
}

func dfs2(_ node: Int) {
    visited.insert(node)
    result += String(node) + " "
    
    for next in degree[node] {
        guard !visited.contains(next) else { continue }
        dfs2(next)
    }
}

func bfs(_ node: Int) {
    q.push(node)
    visited.insert(node)
    
    while !q.isEmpty {
        let current = q.pop()
        result += String(current) + " "
        
        for next in degree[current] {
            guard !visited.contains(next) else { continue }
            q.push(next)
            visited.insert(next)
        }
    }
}
