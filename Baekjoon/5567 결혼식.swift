let n = Int(readLine()!)!
let m = Int(readLine()!)!
var edges = Array(repeating: Set<Int>(), count: n + 1)
var q = [Int]()
var visited = Set<Int>()

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].insert(input[1])
    edges[input[1]].insert(input[0])
}

q.append(1)
visited.insert(1)
var friends = edges[1].count + 1

while !q.isEmpty {
    guard friends > 0 else { break }
    let current = q.removeFirst()
    friends -= 1
    
    for next in edges[current] {
        guard !visited.contains(next) else { continue }
        q.append(next)
        visited.insert(next)
    }
}

print(visited.count - 1)
