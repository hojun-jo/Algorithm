import Foundation

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
        guard !self.isEmpty else { return nil }
        head += 1
        return q[head - 1]
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var q = Queue<Int>()
    var visited = Set<Int>()
    var count = 0
    
    for i in 0..<computers.count {
        guard !visited.contains(i) else { continue }
        
        count += 1
        q.enqueue(i)
        visited.insert(i)

        while let current = q.dequeue() {
            for next in 0..<computers[current].count {
                guard !visited.contains(next),
                      computers[current][next] == 1
                else {
                    continue
                }
                q.enqueue(next)
                visited.insert(next)
            }
        }
    }
    
    return count
}
