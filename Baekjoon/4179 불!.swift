struct Queue<T> {
    var q = [T]()
    var head = 0
    
    var isEmpty: Bool {
        return q.count - head == 0
    }
    
    mutating func enqueue(_ element: T) {
        q.append(element)
    }
    
    mutating func dequeue() -> T? {
        if head < q.count {
            head += 1
            return q[head - 1]
        } else {
            return nil
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (height, width) = (input[0], input[1])
let dydx = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var board = Array(repeating: Array(repeating: 0, count: width), count: height)
var q = Queue<(y: Int, x: Int)>()
var keep = [(y: Int, x: Int)]()
var result = "IMPOSSIBLE"

for y in stride(from: 0, to: height, by: 1) {
    let line = readLine()!.map(String.init)
    
    for x in stride(from: 0, to: line.count, by: 1) {
        switch line[x] {
        case "#":
            board[y][x] = -2
        case "F":
            board[y][x] = -1
            keep.append((y, x))
        case "J":
            board[y][x] = 1
            q.enqueue((y, x))
        default:
            continue
        }
    }
}

for fire in keep {
    q.enqueue(fire)
}

loop: while let (row, col) = q.dequeue() {
    for (dy, dx) in dydx {
        let newRow = row + dy
        let newColumn = col + dx
        
        if board[row][col] == -1 {
            if 0...height - 1 ~= newRow,
               0...width - 1 ~= newColumn {
                guard board[newRow][newColumn] >= 0 else { continue }
                
                board[newRow][newColumn] = -1
                q.enqueue((newRow, newColumn))
            }
        } else {
            if 0...height - 1 ~= newRow,
               0...width - 1 ~= newColumn {
                guard board[newRow][newColumn] == 0 else { continue }
                
                board[newRow][newColumn] = board[row][col] + 1
                q.enqueue((newRow, newColumn))
            } else {
                guard board[row][col] > 0 else { continue }
                
                result = String(board[row][col])
                break loop
            }
        }
    }
}

print(result)
