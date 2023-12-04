import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var alphabet = Set(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]).subtracting(skip).sorted()
    var result = String()
    
    for character in s {
        let jumpIndex = (alphabet.firstIndex(of: character)! + index) % (26 - skip.count)
        
        result += String(alphabet[jumpIndex])
    }
    
    return result
}
