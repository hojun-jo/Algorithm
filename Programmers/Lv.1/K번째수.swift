import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    commands.forEach { command in
        var splitedArray = Array(array[command[0] - 1...command[1] - 1])
        splitedArray.sort()
        result.append(splitedArray[command[2] - 1])
    }
    
    return result
}
