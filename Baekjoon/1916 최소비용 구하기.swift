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

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var edges = Array(repeating: [(node: Int, cost: Int)](), count: n + 1)

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].append((input[1], input[2]))
}

let se = readLine()!.split(separator: " ").map { Int($0)! }
let start = se[0], end = se[1]
var minHeap = Heap<(cost: Int, node: Int)>(comparer: <)
var distance = Array(repeating: Int.max, count: n + 1)

distance[start] = 0
minHeap.push((0, start))

while let current = minHeap.pop() {
    if distance[current.node] != current.cost { continue }
    
    for next in edges[current.node] {
        guard distance[next.node] > distance[current.node] + next.cost else { continue }
        
        distance[next.node] = distance[current.node] + next.cost
        minHeap.push((distance[next.node], next.node))
    }
}

print(distance[end])
