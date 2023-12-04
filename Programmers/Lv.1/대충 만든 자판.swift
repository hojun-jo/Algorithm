import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var alphabet: [Character : Int] = ["A" : 0, "B" : 0, "C" : 0, "D" : 0, "E" : 0, "F" : 0, "G" : 0, "H" : 0, "I" : 0, "J" : 0, "K" : 0, "L" : 0, "M" : 0, "N" : 0, "O" : 0, "P" : 0, "Q" : 0, "R" : 0, "S" : 0, "T" : 0, "U" : 0, "V" : 0, "W" : 0, "X" : 0, "Y" : 0, "Z" : 0]
    var result = [Int]()
    
    for key in keymap {
        let keyArray = Array(key)
        for i in 1...keyArray.count {
            if alphabet[keyArray[i - 1]]! == 0
            || i < alphabet[keyArray[i - 1]]! {
                alphabet[keyArray[i - 1]] = i
            }
        }
    }
    
    for target in targets {
        var count = 0
        
        for character in target {
            if alphabet[character]! == 0 {
                count = -1
                break
            } else {
                count += alphabet[character]!
            }
        }
        
        result.append(count)
    }
    
    return result
}
