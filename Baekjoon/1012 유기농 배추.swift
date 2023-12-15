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

let t = Int(readLine()!)!
let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var board = [[Bool]]()
var visited = [[Bool]]()
var q = Queue<(x: Int, y: Int)>()
var result = String()

for _ in 1...t {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = input[0]
    let n = input[1]
    let k = input[2]
    var count = 0
    board = Array(repeating: Array(repeating: false, count: m), count: n)
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for _ in 1...k {
        let coord = readLine()!.split(separator: " ").map { Int(String($0))! }
        board[coord[1]][coord[0]] = true
    }
    
    for i in 0...n - 1 {
        for j in 0...m - 1 {
            guard board[i][j] == true, visited[i][j] == false else { continue }
            
            count += 1
            q.enqueue((i, j))
            visited[i][j] = true
            
            while !q.isEmpty {
                let (x, y) = q.dequeue()
                
                for (dx, dy) in dxdy {
                    let nx = x + dx
                    let ny = y + dy
                    
                    guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
                    guard board[nx][ny] == true, visited[nx][ny] == false else { continue }
                    
                    q.enqueue((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    result += "\(count)\n"
}

print(result)
