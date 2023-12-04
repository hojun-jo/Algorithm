import Foundation

func solution(_ s:String) -> Int {
    var result = [String]()
    var firstCharacter = String()
    var currentString = String()
    var countX = 0
    var countNotX = 0
    
    for character in s {
        let currentCharacter = String(character)
        
        if firstCharacter.isEmpty {
            firstCharacter = currentCharacter
            countX += 1
        } else if firstCharacter == currentCharacter {
            countX += 1
        } else {
            countNotX += 1
        }
        
        if countX == countNotX {
            result.append(currentString)
            firstCharacter = ""
            currentString = ""
            countX = 0
            countNotX = 0
        } else {
            currentString += currentCharacter
        }
    }
    
    if !currentString.isEmpty {
        result.append(currentString)
    }

    return result.count
}
