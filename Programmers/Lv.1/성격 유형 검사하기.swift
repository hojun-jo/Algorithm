import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result = String()
    var persnality: [Character : Int] = ["R" : 0, "T" : 0, "C" : 0, "F" : 0, "J" : 0, "M" : 0, "A" : 0, "N" : 0]
    
    for i in 0...survey.count - 1 {
        let choose = choices[i] < 4 ? survey[i].first! : survey[i].last!
        
        switch choices[i] {
        case 1, 7:
            persnality[choose]! += 3
        case 2, 6:
            persnality[choose]! += 2
        case 3, 5:
            persnality[choose]! += 1
        default:
            continue
        }
    }
    
    if persnality["R"]! == persnality["T"]! {
        result += "R"
    } else if persnality["R"]! > persnality["T"]! {
        result += "R"
    } else {
        result += "T"
    }
    
    if persnality["C"]! == persnality["F"]! {
        result += "C"
    } else if persnality["C"]! > persnality["F"]! {
        result += "C"
    } else {
        result += "F"
    }
    
    if persnality["J"]! == persnality["M"]! {
        result += "J"
    } else if persnality["J"]! > persnality["M"]! {
        result += "J"
    } else {
        result += "M"
    }
    
    if persnality["A"]! == persnality["N"]! {
        result += "A"
    } else if persnality["A"]! > persnality["N"]! {
        result += "A"
    } else {
        result += "N"
    }
    
    return result
}
