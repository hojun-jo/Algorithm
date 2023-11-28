let n = Int(readLine()!)!
var queue = [String]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    
    switch input[0] {
    case "push":
        queue.append(input[1])
    case "pop":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.removeFirst())
        }
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.first!)
        }
    case "back":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.last!)
        }
    default:
        continue
    }
}
