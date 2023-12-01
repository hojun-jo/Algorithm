let n = Int(readLine()!)!
var result = String()

loop: for _ in 1...n {
    let functions = readLine()!.map(String.init)
    var count = Int(readLine()!)!
    var numbers = readLine()!.dropFirst().dropLast().split(separator: ",").map(String.init)
    
    var head = 0
    var tail = count - 1
    var isReversed = false
    
    for function in functions {
        switch function {
        case "R":
            isReversed.toggle()
        case "D":
            if tail < head {
                result += "error\n"
                continue loop
            }
            
            if isReversed {
                tail -= 1
            } else {
                head += 1
            }
        default:
            continue
        }
    }
    
    if isReversed {
        result += "[\(stride(from: tail, through: head, by: -1).map { numbers[$0] }.joined(separator: ","))]\n"
    } else {
        result += "[\(stride(from: head, through: tail, by: 1).map { numbers[$0] }.joined(separator: ","))]\n"
    }
}

print(result)
