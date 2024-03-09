struct Heap<T: Comparable> {
    private var heap = [T]()
    private let comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return heap.count <= 1
    }
    
    var peek: T? {
        if isEmpty {
            return nil
        }
        return heap[1]
    }
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        heap.append(data)
        moveUp(from: heap.count - 1)
    }
    
    mutating func pop() -> T? {
        let count = heap.count
        if count < 2 {
            return nil
        }
        heap.swapAt(1, count - 1)
        let deletedData = heap.removeLast()
        moveDown(from: 1)
        return deletedData
    }
    
    mutating private func moveUp(from index: Int) {
        var index = index
        while index > 1 &&
                comparer(heap[index], heap[index / 2]) {
            heap.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating private func moveDown(from index: Int) {
        var currentIndex = index
        var isSwap = false
        let leftChildIndex = currentIndex * 2
        let rightChildIndex = currentIndex * 2 + 1
        
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
var minHeap = Heap<Int>(comparer: <)
var result = 0

for _ in 1...n {
    minHeap.push(Int(readLine()!)!)
}

while !minHeap.isEmpty {
    let a = minHeap.pop()!
    guard let b = minHeap.pop() else {
        break
    }
    minHeap.push(a + b)
    result += a + b
}

print(result)
