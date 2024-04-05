let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = Array(repeating: [Int](), count: n + 1)
var degrees = Array(repeating: 0, count: n + 1)
var q = [Int]()
var result = String()

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    edges[input[0]].append(input[1])
    degrees[input[1]] += 1
}

for i in 1...n {
    if degrees[i] == 0 { q.append(i) }
}

while q.isEmpty == false {
    q.sort(by: >)
    let current = q.removeLast()
    result += "\(current) "
    
    for next in edges[current] {
        degrees[next] -= 1
        
        if degrees[next] == 0 { q.append(next) }
    }
}

print(result)
