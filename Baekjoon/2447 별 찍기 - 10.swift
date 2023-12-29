let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: "*", count: n), count: n)

recursion(width: n, r: 0, c: 0)
for line in board {
    print(line.joined())
}

func recursion(width: Int, r: Int, c: Int) {
    if width == 3 {
        board[r + 1][c + 1] = " "
        return
    }
    
    let divisor = width / 3
    
    recursion(width: divisor, r: r, c: c)
    recursion(width: divisor, r: r, c: c + divisor)
    recursion(width: divisor, r: r, c: c + divisor * 2)
    
    recursion(width: divisor, r: r + divisor, c: c)
    removeCenter(width: divisor, r: r + divisor, c: c + divisor)
    recursion(width: divisor, r: r + divisor, c: c + divisor * 2)
    
    recursion(width: divisor, r: r + divisor * 2, c: c)
    recursion(width: divisor, r: r + divisor * 2, c: c + divisor)
    recursion(width: divisor, r: r + divisor * 2, c: c + divisor * 2)
}

func removeCenter(width: Int, r: Int, c: Int) {
    for y in r...r + width - 1 {
        for x in c...c + width - 1 {
            board[y][x] = " "
        }
    }
}
