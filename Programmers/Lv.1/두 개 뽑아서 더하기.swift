import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    
    for i in 0...numbers.count - 2 {
        for j in i + 1...numbers.count - 1 {
            result.append(numbers[i] + numbers[j])
        }
    }
    
    result = Array(Set(result)).sorted()
    return result
}
