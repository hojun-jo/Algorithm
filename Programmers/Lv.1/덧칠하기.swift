import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var start = section[0]
    var result = 1
    
    for i in section {
        if start + m > i {
            continue
        }
        
        start = i
        result += 1
    }
    
    return result
}
