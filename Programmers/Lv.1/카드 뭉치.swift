import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    var result = "Yes"
    
    for word in goal {
        if cards1.first == word {
            cards1.removeFirst()
        } else if cards2.first == word {
            cards2.removeFirst()
        } else {
            result = "No"
            break
        }
    }
    
    return result
}
