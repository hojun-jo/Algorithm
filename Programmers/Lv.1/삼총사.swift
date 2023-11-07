import Foundation

func solution(_ number:[Int]) -> Int {
    let length = number.count
    var result = 0
    
    for i1 in 0...length - 3 {
        for i2 in i1 + 1...length - 2 {
            for i3 in i2 + 1...length - 1 {
                if number[i1] + number[i2] + number[i3] == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result
}
