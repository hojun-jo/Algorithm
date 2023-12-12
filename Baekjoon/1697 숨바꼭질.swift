struct Queue<T> {
    private var q = [T]()
    private var head = 0
    
    var isEmpty: Bool {
        return q.count - head == 0
    }
    
    mutating func enqueue(_ element: T) {
        q.append(element)
    }
    
    mutating func dequeue() -> T {
        head += 1
        return q[head - 1]
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (start, target) = (input[0], input[1])
var board = Array(repeating: 0, count: 100001)
var q = Queue<Int>()
q.enqueue(start)

while !q.isEmpty {
    let current = q.dequeue()
    
    if current == target {
        break
    }
    
    for next in [current - 1, current + 1, current * 2] {
        if next >= 0 && next <= 100000,
           board[next] == 0 {
            q.enqueue(next)
            board[next] = board[current] + 1
        }
    }
}

print(board[target])
