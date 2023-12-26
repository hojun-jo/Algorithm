let n = Int(readLine()!)!
var board = [[Int]]()
var minus = 0
var zero = 0
var one = 0

for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

recursion(size: n, r: 0, c: 0)
for i in [minus, zero, one] {
    print(i)
}

func recursion(size: Int, r: Int, c: Int) {
    if isValid(size: size, r: r, c: c) {
        switch board[r][c] {
        case -1:
            minus += 1
        case 0:
            zero += 1
        default:
            one += 1
        }
        return
    }
    
    let newSize = size / 3
    
    recursion(size: newSize, r: r, c: c)
    recursion(size: newSize, r: r, c: c + newSize)
    recursion(size: newSize, r: r, c: c + newSize * 2)
    
    recursion(size: newSize, r: r + newSize, c: c)
    recursion(size: newSize, r: r + newSize, c: c + newSize)
    recursion(size: newSize, r: r + newSize, c: c + newSize * 2)
    
    recursion(size: newSize, r: r + newSize * 2, c: c)
    recursion(size: newSize, r: r + newSize * 2, c: c + newSize)
    recursion(size: newSize, r: r + newSize * 2, c: c + newSize * 2)
}

func isValid(size: Int, r: Int, c: Int) -> Bool {
    let first = board[r][c]
    
    for i in r...r + size - 1 {
        for j in c...c + size - 1 {
            guard board[i][j] == first else { return false }
        }
    }
    
    return true
}
