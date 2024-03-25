let n = Int(readLine()!)!
var edges = Array(repeating: [Int](), count: n + 1)
var parents = Array(repeating: 0, count: n + 1)
var result = String()

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}

dfs(1)

for i in 2...n {
    result += String(parents[i]) + "\n"
}

print(result)

func dfs(_ start: Int) {
    for next in edges[start] {
        guard parents[next] == 0 else { continue }
        parents[next] = start
        dfs(next)
    }
}
