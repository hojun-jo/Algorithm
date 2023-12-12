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

var board = [[Int]]()
var queue = Queue<(x: Int, y: Int)>()
var countOfArt = 0
var maxArea = 0
let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 1...input[0] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    board.append(line)
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var area = 0
    queue.enqueue((i, j))
    
    while !queue.isEmpty {
        let (x, y) = queue.dequeue()
        
        guard visited[x][y] == false else { continue }
        
        visited[x][y] = true
        area += 1
        
        for (dx, dy) in dxdy {
            let nx = x + dx
            let ny = y + dy
            
            guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
            guard board[nx][ny] == 1, visited[nx][ny] == false else { continue }
            
            queue.enqueue((nx, ny))
        }
    }
    
    return area
}

for i in 0...n - 1 {
    for j in 0...m - 1 {
        if board[i][j] == 0
        || visited[i][j] == true {
            continue
        }
        
        if board[i][j] == 1, visited[i][j] == false {
            countOfArt += 1
            let area = bfs(i, j)
            maxArea = max(maxArea, area)
        }
    }
}

print(countOfArt)
print(maxArea)
