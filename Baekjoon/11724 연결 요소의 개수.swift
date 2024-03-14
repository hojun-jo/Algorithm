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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var degree = Array(repeating: Set<Int>(), count: n + 1)
var q = Queue<Int>()
var visited = Set<Int>()
var count = 0

for _ in 1..<m + 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    degree[input[0]].insert(input[1])
    degree[input[1]].insert(input[0])
}

for i in 1...n {
    guard !visited.contains(i) else { continue }
    
    count += 1
    q.push(i)
    visited.insert(i)
    
    while !q.isEmpty {
        let current = q.pop()
        for node in degree[current] {
            guard !visited.contains(node) else { continue }
            q.push(node)
            visited.insert(node)
        }
    }
}

print(count)
