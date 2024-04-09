struct Heap<T> {
  private var heap = [T]()
  private let comparer: (T, T) -> Bool
  
  var isEmpty: Bool {
    return heap.isEmpty
  }
  
  var peek: T? {
    return heap.first
  }
  
  init(comparer: @escaping (T, T) -> Bool) {
    self.comparer = comparer
  }
  
  mutating func push(_ data: T) {
    heap.append(data)
    moveUp(from: heap.count - 1)
  }
  
  mutating func pop() -> T? {
    let count = heap.count
    guard count > 0 else { return nil }
    heap.swapAt(0, count - 1)
    let deletedData = heap.removeLast()
    moveDown(from: 0)
    return deletedData
  }
  
  mutating func removeAll() {
    heap.removeAll()
  }
  
  mutating private func moveUp(from index: Int) {
    var index = index
    while index > 0 &&
            comparer(heap[index], heap[(index - 1) / 2]) {
      heap.swapAt(index, (index - 1) / 2)
      index = (index - 1) / 2
    }
  }
  
  mutating private func moveDown(from index: Int) {
    var currentIndex = index
    var isSwap = false
    let leftChildIndex = currentIndex * 2 + 1
    let rightChildIndex = currentIndex * 2 + 2
    
    if leftChildIndex < heap.endIndex &&
        comparer(heap[leftChildIndex], heap[currentIndex]) {
      currentIndex = leftChildIndex
      isSwap = true
    }
    
    if rightChildIndex < heap.endIndex &&
        comparer(heap[rightChildIndex], heap[currentIndex]) {
      currentIndex = rightChildIndex
      isSwap = true
    }
    
    if isSwap {
      heap.swapAt(currentIndex, index)
      moveDown(from: currentIndex)
    }
  }
}

let ve = readLine()!.split(separator: " ").map { Int($0)! }
let v = ve[0], e = ve[1]
var edges = Array(repeating: [(node: Int, weight: Int)](), count: v + 1)
var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
var group = Set<Int>()
var result = 0

for _ in 1...e {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].append((input[1], input[2]))
  edges[input[1]].append((input[0], input[2]))
}

group.insert(1)
for next in edges[1] {
  heap.push((next.node, next.weight))
}

while let current = heap.pop(),
      group.count < v {
  guard group.contains(current.node) == false else { continue }
  
  result += current.weight
  group.insert(current.node)
  
  for next in edges[current.node] {
    heap.push((next.node, next.weight))
  }
}

print(result)
