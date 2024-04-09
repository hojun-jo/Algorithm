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
var costs = [Int]()
var linkCosts = [[Int]]()
var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
var visited = Set<Int>()
var result = 0

for _ in 1...n {
  costs.append(Int(readLine()!)!)
}

for _ in 1...n {
  linkCosts.append(readLine()!.split(separator: " ").map { Int($0)! })
}

linkCosts.append(costs)
for i in 0..<n {
    linkCosts[i].append(costs[i])
}

visited.insert(0)
for (node, weight) in linkCosts[0].enumerated() {
  if weight == 0 { continue }
  heap.push((node, weight))
}

while let current = heap.pop(),
      visited.count < n + 1 {
  guard visited.contains(current.node) == false else { continue }
  
  result += current.weight
  visited.insert(current.node)
  
  for (node, weight) in linkCosts[current.node].enumerated() {
    if weight == 0 { continue }
    heap.push((node, weight))
  }
}

print(result)
