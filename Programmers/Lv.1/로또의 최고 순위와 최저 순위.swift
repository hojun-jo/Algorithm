import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var min = 7
    var max = 0
    var countOfZero = 0
    
    for number in win_nums {
        if lottos.contains(number) {
            min -= 1
        }
    }
    
    for number in lottos {
        if number == 0 {
            countOfZero += 1
        }
    }
    
    if min == 7 {
        min = 6
    }
    
    max = min - countOfZero
    if max == 0 {
        max = 1
    }
    
    return [max, min]
}
