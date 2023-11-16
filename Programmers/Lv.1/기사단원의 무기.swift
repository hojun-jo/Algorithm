import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = [Int]()
    
    for knight in 1...number {
        var count = 0
        
        for i in 1...Int(sqrt(Double(knight))) {
            if knight % i == 0 {
                if i * i == knight {
                    count += 1
                } else {
                    count += 2
                }
            }
        }
        
        count = count > limit ? power : count
        result.append(count)
    }
    
    return result.reduce(0) { $0 + $1 }
}
