import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let height = park.count
    let width = park[0].count
    var board = [[String]]()
    var current = (y: 0, x: 0)
    
    for i in park {
        let line = i.map(String.init)
        board.append(line)
    }
    
    for i in 0...height - 1 {
        for j in 0...width - 1 {
            if board[i][j] == "S" {
                current = (i, j)
            }
        }
    }
    
    loop: for r in routes {
        let path = r.split(separator: " ").map(String.init)
        let direction = path[0]
        let move = Int(path[1])!

        switch direction {
        case "N":
            for i in 1...move {
                guard current.y - i >= 0,
                    board[current.y - i][current.x] != "X"
                else {
                    continue loop
                }
            }
            current = (current.y - move, current.x)
        case "E":
            for i in 1...move {
                guard current.x + i < width,
                    board[current.y][current.x + i] != "X"
                else {
                    continue loop
                }
            }
            current = (current.y, current.x + move)
        case "S":
            for i in 1...move {
                guard current.y + i < height,
                    board[current.y + i][current.x] != "X"
                else {
                    continue loop
                }
            }
            current = (current.y + move, current.x)
        default:
            for i in 1...move {
                guard current.x - i >= 0,
                    board[current.y][current.x - i] != "X"
                else {
                    continue loop
                }
            }
            current = (current.y, current.x - move)
        }
    }
    
    return [current.y, current.x]
}
