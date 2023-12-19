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

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (width, height) = (input[0], input[1])
let dydx = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var board = [[Int]]()
var q = Queue<(y: Int, x: Int)>()

for _ in 1...height {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

for y in 0...height - 1 {
    for x in 0...width - 1 {
        if board[y][x] == 1 {
            q.enqueue((y, x))
        }
    }
}

while !q.isEmpty {
    let (y, x) = q.dequeue()
    
    for (dy, dx) in dydx {
        let ny = y + dy
        let nx = x + dx
        
        guard 0...height-1 ~= ny,
              0...width-1 ~= nx,
              board[ny][nx] == 0
        else {
            continue
        }

        board[ny][nx] = board[y][x] + 1
        q.enqueue((ny, nx))
    }
}

let flatBoard = board.flatMap { $0 }

if flatBoard.contains(0) {
    print(-1)
} else {
    print(flatBoard.max()! - 1)
}
