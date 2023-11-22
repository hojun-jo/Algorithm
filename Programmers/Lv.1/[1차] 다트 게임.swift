import Foundation

func solution(_ dartResult:String) -> Int {
    var dartResult = dartResult.replacingOccurrences(of: "10", with: "t")
    var dartResultArray = dartResult.map(String.init)
    var starIndex = [Int]()
    var shopIndex = [Int]()
    var computedScore = [Int]()
    
    while dartResultArray.contains("*") {
        guard let index = dartResultArray.firstIndex(of: "*") else {
            break
        }
        starIndex.append(index / 3)
        dartResultArray.remove(at: index)
    }
    
    while dartResultArray.contains("#") {
        guard let index = dartResultArray.firstIndex(of: "#") else {
            break
        }
        shopIndex.append(index / 3)
        dartResultArray.remove(at: index)
    }
    
    for _ in 1...3 {
        var result = 0
        for _ in 1...2 {
            let input = dartResultArray.removeFirst()
            switch input {
                case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                result = Int(input)!
                case "t":
                result = 10
                case "S":
                result = result * 1
                case "D":
                result = result * result
                case "T":
                result = result * result * result
                default:
                result += 0
            }
        }
        
        computedScore.append(result)
    }
    
    while let n = starIndex.first {
        let range: ClosedRange<Int> = {
            if n == 0 {
                return 0...0
            } else {
                return n - 1...n
            }
        }()
        
        for i in range {
            computedScore[i] *= 2
        }
        starIndex.removeFirst()
    }
    
    while let n = shopIndex.first {
        computedScore[n] *= -1
        shopIndex.removeFirst()
    }
    
    return computedScore.reduce(0, +)
}
