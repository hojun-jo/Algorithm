let n = Int(readLine()!)!
var deque = [String]()
var result = String()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    
    switch input[0] {
    case "push_front":
        deque.insert(input[1], at: 0)
    case "push_back":
        deque.append(input[1])
    case "pop_front":
        result += deque.first != nil ? "\(deque.removeFirst())\n" : "-1\n"
    case "pop_back":
        result += deque.last != nil ? "\(deque.removeLast())\n" : "-1\n"
    case "size":
        result += "\(deque.count)\n"
    case "empty":
        result += deque.isEmpty ? "1\n" : "0\n"
    case "front":
        result += deque.first != nil ? "\(deque.first!)\n" : "-1\n"
    case "back":
        result += deque.last != nil ? "\(deque.last!)\n" : "-1\n"
    default:
        continue
    }
}

print(result)
