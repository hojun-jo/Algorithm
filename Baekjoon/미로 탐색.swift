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
let (n, m) = (input[0], input[1])
let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var board = [[Int]]()
var distance = Array(repeating: Array(repeating: 0, count: m), count: n)
var q = Queue<(x: Int, y: Int, dist: Int)>()

for _ in 1...n {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
}

q.enqueue((0, 0, 1))

while !q.isEmpty {
    let (x, y, dist) = q.dequeue()
    
    guard distance[x][y] == 0 else { continue }
    
    distance[x][y] = dist
    
    if x == n - 1 && y == m - 1 {
        break
    }
    
    for (dx, dy) in dxdy {
        let nx = x + dx
        let ny = y + dy
        
        guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
        guard board[nx][ny] == 1, distance[nx][ny] == 0 else { continue }
        
        q.enqueue((nx, ny, dist + 1))
    }
}

print(distance[n - 1][m - 1])
