import Foundation

func solution(_ food:[Int]) -> String {
    var order: [String] = []
    var result = ""
    
    for i in 1...food.count - 1 {
        order.append(String(repeating: String(i), count: food[i] / 2))
    }
    
    order.forEach {
        result += $0
    }
    
    result += "0"
    
    order.reversed().forEach {
        result += $0
    }
    
    return result
}
