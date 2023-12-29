let n = Int(readLine()!)!
var board = [[String]]()
var result = String()

for _ in 1...n {
    board.append(readLine()!.map(String.init))
}

recursion(width: n, r: 0, c: 0)
print(result)

func recursion(width: Int, r: Int, c: Int) {
    if isValid(width: width, r: r, c: c) {
        if board[r][c] == "0" {
            result += "0"
        } else {
            result += "1"
        }
        return
    }
    
    let half = width / 2
    
    result += "("
    recursion(width: half, r: r, c: c)
    recursion(width: half, r: r, c: c + half)
    recursion(width: half, r: r + half, c: c)
    recursion(width: half, r: r + half, c: c + half)
    result += ")"
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
