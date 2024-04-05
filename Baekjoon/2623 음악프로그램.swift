struct Queue<T> {
  private var q = [T]()
  private var head = 0
  
  var isEmpty: Bool {
    return q.count - head == 0
  }
  
  mutating func enqueue(_ element: T) {
    q.append(element)
  }
  
  mutating func dequeue() -> T? {
    guard self.isEmpty == false else { return nil }
    head += 1
    return q[head - 1]
  }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = Array(repeating: [Int](), count: n + 1)
var degrees = Array(repeating: 0, count: n + 1)
var q = Queue<Int>()
var result = [String]()

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  
  for i in 1..<input.count - 1 {
    edges[input[i]].append(input[i + 1])
    degrees[input[i + 1]] += 1
  }
}

for i in 1...n {
  if degrees[i] == 0 {
    q.enqueue(i)
  }
}

while let current = q.dequeue() {
  result.append(String(current))
  
  for next in edges[current] {
    degrees[next] -= 1
    
    if degrees[next] == 0 {
      q.enqueue(next)
    }
  }
}

print(result.count == n ? result.joined(separator: "\n") : "0")
