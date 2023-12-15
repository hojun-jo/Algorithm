let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (width, height, testCase) = (input[1], input[0], input[2])
var board = Array(repeating: Array(repeating: false, count: width), count: height)
var areas = [Int]()

for _ in 1...testCase {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (startX, startY) = (points[0], points[1])
    let (endX, endY) = (points[2] - 1, points[3] - 1)
    
    for y in startY...endY {
        for x in startX...endX {
            board[y][x] = true
        }
    }
}

for y in 0...height - 1 {
    for x in 0...width - 1 {
        if board[y][x] { continue }
        
        areas.append(dfs(x, y))
    }
}

print("\(areas.count)\n\(areas.sorted().map(String.init).joined(separator: " "))")

func dfs(_ x: Int, _ y: Int) -> Int {
    var stack = [(x, y)]
    var area = 1
    board[y][x] = true
    
    while !stack.isEmpty {
        let (x, y) = stack.removeLast()
        
        for (dx, dy) in dxdy {
            let nx = x + dx
            let ny = y + dy
            
            guard 0...width - 1 ~= nx,
                  0...height - 1 ~= ny,
                  board[ny][nx] == false
            else {
                continue
            }
            
            board[ny][nx] = true
            area += 1
            stack.append((nx, ny))
        }
    }
    
    return area
}
