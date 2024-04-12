let n = Int(readLine()!)!
let m = Int(readLine()!)!
var costs = Array(repeating: Array(repeating: Int.max, count: n), count: n)

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  costs[input[0] - 1][input[1] - 1] = min(input[2], costs[input[0] - 1][input[1] - 1])
}

for mid in 0..<n {
  costs[mid][mid] = 0
  for start in 0..<n where costs[start][mid] < .max {
    for target in 0..<n where costs[mid][target] < .max {
      costs[start][target] = min(costs[start][target], costs[start][mid] + costs[mid][target])
    }
  }
}

for start in 0..<n {
  for target in 0..<n {
    if costs[start][target] == Int.max {
      costs[start][target] = 0
    }
  }
}

print(
  costs.map {
    $0.map(String.init)
      .joined(separator: " ")
  }.joined(separator: "\n")
)
