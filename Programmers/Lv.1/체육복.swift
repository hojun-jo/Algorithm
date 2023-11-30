import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let newLost = lost.filter { !reserve.contains($0) }.sorted()
    var newReserve = reserve.filter { !lost.contains($0) }.sorted()
    var result = n - newLost.count
    
    for lost in newLost {
        for i in stride(from: 0, to: newReserve.count, by: 1) {
            if lost == newReserve[i] - 1
            || lost == newReserve[i] + 1 {
                newReserve.remove(at: i)
                result += 1
                
                break
            }
        }
    }
    
    return result
}
