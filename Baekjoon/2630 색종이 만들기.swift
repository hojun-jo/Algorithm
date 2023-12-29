let n = Int(readLine()!)!
var board = [[Int]]()
var white = 0
var blue = 0

for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

recursion(width: n, r: 0, c: 0)
print(white)
print(blue)

func recursion(width: Int, r: Int, c: Int) {
    if isValid(width: width, r: r, c: c) {
        if board[r][c] == 0 {
            white += 1
        } else {
            blue += 1
        }
        return
    }
    
    let half = width / 2
    
    recursion(width: half, r: r, c: c)
    recursion(width: half, r: r, c: c + half)
    recursion(width: half, r: r + half, c: c)
    recursion(width: half, r: r + half, c: c + half)
}

func isValid(width: Int, r: Int, c: Int) -> Bool {
    let first = board[r][c]
    
    for y in r...r + width - 1 {
        for x in c...c + width - 1 {
            guard first == board[y][x] else { return false }
        }
    }
    
    return true
}
