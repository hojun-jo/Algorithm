import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var sortedScore = score.sorted()
    var result = 0
    
    while !sortedScore.isEmpty {
        for i in 1...m {
            if i == m,
                let last = sortedScore.last {
                result += last * m
            }
            sortedScore.popLast()
        }
    }
    
    return result
}
