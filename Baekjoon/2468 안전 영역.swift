let dydx = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let width = Int(readLine()!)!
var board = [[Int]]()
var countArray = [Int]()

for _ in 1...width {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

var flatBoard = board.flatMap { $0 }
let min = flatBoard.min()!
let max = flatBoard.max()!

for n in min - 1...max {
    countArray.append(dfs(n))
}

func dfs(_ n: Int) -> Int {
    var board = board
    var stack = [(y: Int, x: Int)]()
    var count = 0
    
    for y in 0...width - 1 {
        for x in 0...width - 1 {
            if board[y][x] <= n || board[y][x] == 0 { continue }
            
            count += 1
            board[y][x] = 0
            stack.append((y, x))
            
            while !stack.isEmpty {
                let (y, x) = stack.removeLast()
                
                for (dy, dx) in dydx {
                    let ny = y + dy
                    let nx = x + dx
                    
                    guard 0...width - 1 ~= ny,
                          0...width - 1 ~= nx,
                          board[ny][nx] > n
                    else {
                        continue
                    }
                    
                    board[ny][nx] = 0
                    stack.append((ny, nx))
                }
            }
        }
    }
    
    return count
}

print(countArray.max()!)
