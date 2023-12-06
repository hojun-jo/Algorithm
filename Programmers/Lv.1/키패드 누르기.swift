import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let distance = [2:[1:1, 2:0, 3:1, 4:2, 5:1, 6:2, 7:3, 8:2, 9:3, 10:4, 0:3, 12:4],
                   5:[1:2, 2:1, 3:2, 4:1, 5:0, 6:1, 7:2, 8:1, 9:2, 10:3, 0:2, 12:3],
                   8:[1:3, 2:2, 3:3, 4:2, 5:1, 6:2, 7:1, 8:0, 9:1, 10:2, 0:1, 12:2],
                   0:[1:4, 2:3, 3:4, 4:3, 5:2, 6:3, 7:2, 8:1, 9:2, 10:1, 0:0, 12:1]]
    var result = String()
    var currentL = 10
    var currentR = 12
    
    for number in numbers {
        switch number {
        case 1, 4, 7:
            result += "L"
            currentL = number
        case 3, 6, 9:
            result += "R"
            currentR = number
        default:
            let l = distance[number]![currentL]!
            let r = distance[number]![currentR]!
            
            if l == r {
                if hand == "left" {
                    result += "L"
                    currentL = number
                } else {
                    result += "R"
                    currentR = number
                }
            } else if l < r {
                result += "L"
                currentL = number
            } else {
                result += "R"
                currentR = number
            }
        }
    }
    
    return result
}
