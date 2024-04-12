let n = Int(readLine()!)!
let m = Int(readLine()!)!
var costs = Array(repeating: Array(repeating: Int.max, count: n), count: n)
var nexts = Array(repeating: Array(repeating: 0, count: n), count: n)
var result = String()

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  costs[input[0] - 1][input[1] - 1] = min(input[2], costs[input[0] - 1][input[1] - 1])
  nexts[input[0] - 1][input[1] - 1] = input[1] - 1
}

for mid in 0..<n {
  costs[mid][mid] = 0
  
  for start in 0..<n where costs[start][mid] < .max {
    for target in 0..<n where costs[mid][target] < .max {
      let compared = costs[start][mid] + costs[mid][target]
      
      if compared < costs[start][target] {
        costs[start][target] = compared
        nexts[start][target] = nexts[start][mid]
      }
    }
  }
}

for start in 0..<n {
  for target in 0..<n {
    if costs[start][target] == .max {
      costs[start][target] = 0
    }
  }
}

result += costs.map {
  $0.map(String.init)
    .joined(separator: " ")
}.joined(separator: "\n")
result += "\n"

for start in 0..<n {
  for target in 0..<n {
    if costs[start][target] == 0 {
      result += "0\n"
      continue
    }
    
    var path = [start + 1]
    var start = start
    
    while start != target {
      path.append(nexts[start][target] + 1)
      start = nexts[start][target]
    }
    
    result += String(path.count) + " " + path.map(String.init).joined(separator: " ") + "\n"
  }
}

print(result)
