import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var count = 0
    var stack = [Int]()
    
    for move in moves {
        for i in 0...board.count - 1 {
            if board[i][move-1] != 0 {
                if stack.last == board[i][move-1] {
                    stack.removeLast()
                    count += 2
                } else {
                    stack.append(board[i][move-1])
                }
                
                board[i][move-1] = 0
                break
            }
        }
    }
    
    return count
}
