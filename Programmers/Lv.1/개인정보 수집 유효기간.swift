import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = timeConvert(today)
    var termsDict = [String : Int]()
    var result = [Int]()
    
    for term in terms {
        let tmp = term.split(separator: " ").map(String.init)
        termsDict[tmp[0]] = Int(tmp[1])! * 28
    }
    
    for i in 0...privacies.count - 1 {
        let tmp = privacies[i].split(separator: " ").map(String.init)
        let end = timeConvert(tmp[0]) + termsDict[tmp[1]]!
        
        if end <= today {
            result.append(i + 1)
        }
    }
    
    return result
}

func timeConvert(_ t: String) -> Int {
    let days = t.split(separator: ".").map { Int(String($0))! }
    return days[0] * 12 * 28 + days[1] * 28 + days[2]
}
