import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let n = p.count
    let intP = Int(p)!
    var arr = t.map { String($0) }
    var numbers: [Int] = []
    var result = 0
    
    for _ in arr {
        var tmp: [String] = []
        var count = 0
        
        for char in arr {
            if count < n {
                tmp.append(char)
                count += 1
            } else {
                numbers.append(Int(tmp.joined())!)
                break
            }
        }

        if arr.count > n {
            arr.removeFirst()
        } else {
            numbers.append(Int(arr.joined())!)
            break
        }
    }
    
    numbers.forEach {
        if $0 <= intP {
            result += 1
        }
    }

    return result
}
