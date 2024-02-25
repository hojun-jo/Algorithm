import Foundation

enum Direction {
    case right, up, down
}

func solution(_ n:Int) -> [Int] {
    var result = [Int]()
    var tmp = Array(repeating: Array(repeating: 0, count: n), count: n)
    var n = n
    var y = 0
    var x = 0
    var current = 1
    var direction = Direction.down
    
    while n > 0 {
        switch direction {
        case .right:
            for _ in 1...n {
                tmp[y][x] = current
                x += 1
                current += 1
            }
            
            x -= 1
            n -= 1
            
            direction = .up
            x -= 1
            y -= 1
        case .up:
            for _ in 1...n {
                tmp[y][x] = current
                x -= 1
                y -= 1
                current += 1
            }
            
            x += 1
            y += 1
            n -= 1
            
            direction = .down
            y += 1
        case .down:
            for _ in 1...n {
                tmp[y][x] = current
                y += 1
                current += 1
            }
            
            y -= 1
            n -= 1
            
            direction = .right
            x += 1
        }
    }
    
    for line in tmp {
        for number in line {
            if number > 0 {
                result.append(number)
            }
        }
    }
    
    return result
}
