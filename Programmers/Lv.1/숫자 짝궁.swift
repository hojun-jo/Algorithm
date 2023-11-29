import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var pairs = [String]()
    var result = String()
    
    for i in 0...9 {
        let xCount = X.filter { String($0) == String(i) }.count
        let yCount = Y.filter { String($0) == String(i) }.count
        
        pairs += Array(repeating: String(i), count: min(xCount, yCount))
    }
    
    pairs.sort(by: >)
    
    if pairs.isEmpty {
        result = "-1"
    } else if pairs.first == "0" {
        result = "0"
    } else {
        result = pairs.joined()
    }
    
    return result
}
