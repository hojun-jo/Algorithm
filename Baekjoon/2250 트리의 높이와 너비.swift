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

let n = Int(readLine()!)!
var child = [Int : (left: Int, right: Int)]()
var tree = [Int]()
var levels = [Int : Int]()
var width = [Int : (min: Int, max: Int)]()
var isRoot = Set(1...n)

for _ in 1...n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  child[input[0]] = (input[1], input[2])
  isRoot.remove(input[1])
  isRoot.remove(input[2])
}

var root = isRoot.first!
inorder(root)
bfs(root)

for (index, node) in tree.enumerated() {
  width[levels[node]!] = (
    min(index + 1, width[levels[node]!]?.min ?? Int.max),
    max(index + 1, width[levels[node]!]?.max ?? Int.min)
  )
}

let result = width.map {
  ($0.key, $0.value.max - $0.value.min + 1)
}.sorted {
  ($0.1, $1.0) > ($1.1, $0.0)
}

print(result.first!.0, result.first!.1)

func inorder(_ node: Int) {
  if child[node]!.left != -1 {
    inorder(child[node]!.left)
  }
  
  tree.append(node)
  
  if child[node]!.right != -1 {
    inorder(child[node]!.right)
  }
}

func bfs(_ root: Int) {
  var q = Queue<Int>()
  q.enqueue(root)
  levels[root] = 1
  
  while let current = q.dequeue() {
    for node in [child[current]?.left, child[current]?.right] {
      guard let next = node else { continue }
      
      levels[next] = levels[current]! + 1
      q.enqueue(next)
    }
  }
}
