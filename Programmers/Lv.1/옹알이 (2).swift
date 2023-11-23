import Foundation

func solution(_ babbling:[String]) -> Int {
    var result = 0
    
    for word in babbling {
        var replaced = word
        
        ["ayaaya", "yeye", "woowoo", "mama"].forEach {
            replaced = replaced.replacingOccurrences(of: $0, with: "0")
        }
        ["aya", "ye", "woo", "ma"].forEach {
            replaced = replaced.replacingOccurrences(of: $0, with: "1")
        }
        replaced = replaced.replacingOccurrences(of: "1", with: "")
        
        if replaced.isEmpty {
            result += 1
        }
    }
    
    return result
}
