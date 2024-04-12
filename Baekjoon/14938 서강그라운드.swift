let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmr[0], m = nmr[1], r = nmr[2]
let items = readLine()!.split(separator: " ").map { Int($0)! }
var costs = Array(repeating: Array(repeating: Int.max, count: n), count: n)

for _ in 1...r {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  costs[input[0] - 1][input[1] - 1] = input[2]
  costs[input[1] - 1][input[0] - 1] = input[2]
}

for i in 0..<n {
  costs[i][i] = 0
}

for i in 0..<n {
  for start in 0..<n {
    guard costs[start][i] < Int.max else { continue }
    for target in 0..<n {
      guard costs[i][target] < Int.max else { continue }
      costs[start][target] = min(costs[start][target], costs[start][i] + costs[i][target])
    }
  }
}

print(
  costs.map { line in
    line.enumerated()
      .map { (index, element) in
        guard element <= m else { return 0 }
        return items[index]
      }.reduce(0, +)
  }.max()!
)
