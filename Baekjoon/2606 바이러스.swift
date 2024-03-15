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
let m = Int(readLine()!)!
var degrees = Array(repeating: Set<Int>(), count: n + 1)
var q = Queue<Int>()
var visited = Set<Int>()
var count = 0

for _ in 1..<m + 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    degrees[input[0]].insert(input[1])
    degrees[input[1]].insert(input[0])
}

q.push(1)
visited.insert(1)

while let current = q.pop() {
    for next in degrees[current] {
        guard !visited.contains(next) else { continue }
        count += 1
        q.push(next)
        visited.insert(next)
    }
}

print(count)
