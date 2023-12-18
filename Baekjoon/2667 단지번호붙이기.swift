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

let dydx = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let width = Int(readLine()!)!
var board = [[Int]]()
var count = 0
var areas = [Int]()

for _ in 1...width {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
}

for y in 0...width - 1 {
    for x in 0...width - 1 {
        if board[y][x] == 0 { continue }
        
        count += 1
        areas.append(dfs(y, x))
    }
}

print(count)
for area in areas.sorted() {
    print(area)
}

func dfs(_ y: Int, _ x: Int) -> Int {
    var q = Queue<(y: Int, x: Int)>()
    var area = 0
    board[y][x] = 0
    q.enqueue((y, x))
    
    while !q.isEmpty {
        let (y, x) = q.dequeue()
        area += 1
        
        for (dy, dx) in dydx {
            let ny = y + dy
            let nx = x + dx
            
            guard 0...width - 1 ~= ny,
                  0...width - 1 ~= nx,
                  board[ny][nx] == 1
            else {
                continue
            }
            
            board[ny][nx] = 0
            q.enqueue((ny, nx))
        }
    }
    
    return area
}
