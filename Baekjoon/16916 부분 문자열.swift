func getFailure<T: Equatable>(of array: [T]) -> [Int] {
    var failure = Array(repeating: 0, count: array.count)
    var length = 0
    var index = 1
    
    while index < array.count {
        if array[index] == array[length] {
            length += 1
            failure[index] = length
            index += 1
        } else if length == 0 {
            failure[index] = 0
            index += 1
        } else {
            length = failure[length - 1]
        }
    }
    
    return failure
}

let text = Array(readLine()!)
let target = Array(readLine()!)
let failure = getFailure(of: text)
var length = 0
var index = 0

while index < text.count {
    if text[index] == target[length] {
        length += 1
        index += 1
        
        if length == target.count { break }
    } else if length == 0 {
        index += 1
    } else {
        length = failure[length - 1]
    }
}

print(length == target.count ? 1 : 0)
