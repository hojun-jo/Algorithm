import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var day = 1
    var theHallOfFame = [Int]()
    var result = [Int]()
    
    score.forEach {
        if day <= k {
            theHallOfFame.append($0)
            result.append(theHallOfFame.min()!)
        } else {
            if $0 > theHallOfFame.min()! {
                theHallOfFame.sort()
                theHallOfFame.removeFirst()
                theHallOfFame.append($0)
            }
            
            result.append(theHallOfFame.min()!)
        }
        
        day += 1
    }
    
    return result
}
