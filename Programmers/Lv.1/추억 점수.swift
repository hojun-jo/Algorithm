import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dictionary = [String : Int]()
    var result = [Int]()
    
    for i in 0...name.count - 1 {
        dictionary[name[i]] = yearning[i]
    }
    
    photo.forEach { names in
        var score = 0
        
        names.forEach { name in
            score += dictionary[name] ?? 0
        }
                   
        result.append(score)
    }
    
    return result
}
