import Foundation

func solution(_ numbers:[Int]) -> String {
    let result: String = numbers.map(String.init)
        .sorted {
            $0 + $1 > $1 + $0
        }
        .joined()
    
    return result.first == "0" ? "0" : result
}
