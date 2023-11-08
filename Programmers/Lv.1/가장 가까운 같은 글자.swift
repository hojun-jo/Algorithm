import Foundation

func solution(_ s:String) -> [Int] {
    let original = Array(s)
    var checkingCharacter: [Character] = []
    var result: [Int] = []
    
    for i in 0..<original.count {
        checkingCharacter.append(original[i])
        
        var index = i - 1
        var flag = false
        var n = 1
        while index >= 0 {
            if checkingCharacter[index] == original[i] {
                flag = true
                result.append(n)
                break
            }
            
            index -= 1
            n += 1
        }
        
        if flag == false {
            result.append(-1)
        }
    }
    
    return result
}
