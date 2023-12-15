struct Queue<T> {
    var q = [T]()
    var head = 0
    
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

let dxdy = [(-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1)]
let testCase = Int(readLine()!)!
var result = String()

for _ in 1...testCase {
    var q = Queue<(x: Int, y: Int)>()
    let width = Int(readLine()!)!
    let startPoint = readLine()!.split(separator: " ").map { Int(String($0))! }
    let targetPoint = readLine()!.split(separator: " ").map { Int(String($0))! }
    var board = Array(repeating: Array(repeating: 0, count: width), count: width)
    
    q.enqueue((startPoint[0], startPoint[1]))
    
    while !q.isEmpty {
        let (x, y) = q.dequeue()
        
        if x == targetPoint[0], y == targetPoint[1] { break }
        
        for (dx, dy) in dxdy {
            let nx = x + dx
            let ny = y + dy
            
            guard 0...width-1 ~= nx, 0...width-1 ~= ny else { continue }
            guard board[nx][ny] == 0 else { continue }
            
            board[nx][ny] = board[x][y] + 1
            q.enqueue((nx, ny))
        }
    }
    
    result += "\(board[targetPoint[0]][targetPoint[1]])\n"
}

print(result)
