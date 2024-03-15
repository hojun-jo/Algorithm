struct Queue<T> {
    private var q = [T]()
    private var head = 0
    
    var isEmpty: Bool {
        return q.count - head == 0
    }
    
    mutating func push(_ element: T) {
        q.append(element)
    }
    
    mutating func pop() -> T? {
        guard !self.isEmpty else { return nil }
        head += 1
        return q[head - 1]
    }
}

let n = Int(readLine()!)!
var array = [[Int]]()
var result = Array(repeating: Array(repeating: "0", count: n), count: n)

for _ in 1...n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    bfs(i).forEach {
        result[i][$0] = "1"
    }
}

print(result.map{$0.joined(separator: " ")}.joined(separator: "\n"))

func bfs(_ start: Int) -> Set<Int> {
    var q = Queue<Int>()
    var visited = Set<Int>()
    q.push(start)
    
    while let current = q.pop() {
        for i in 0..<n {
            guard array[current][i] == 1,
                  !visited.contains(i)
            else {
                continue
            }
            
            q.push(i)
            visited.insert(i)
        }
    }
    return visited
}
