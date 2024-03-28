let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = Array(repeating: [(node: Int, distance: Int)](), count: n + 1)
var result = String()

for _ in 1..<n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].append((input[1], input[2]))
  edges[input[1]].append((input[0], input[2]))
}

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  result += "\(dfs(input[0], input[1]))\n"
}

print(result)

func dfs(_ start: Int, _ target: Int) -> Int {
  var stack = [(node: Int, totalDistance: Int)]()
  var visited = Set<Int>()
  var totalDistance = 0
  
  stack.append((start, 0))
  visited.insert(start)
  
  while let current = stack.popLast() {
    if current.node == target { totalDistance = current.totalDistance }
    
    for (next, distance) in edges[current.node] {
      guard visited.contains(next) == false else { continue }
      
      stack.append((next, current.totalDistance + distance))
      visited.insert(next)
    }
  }
  
  return totalDistance
}
