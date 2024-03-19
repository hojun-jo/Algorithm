let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = Array(repeating: Set<Int>(), count: n + 1)
var result = [Int]()

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].insert(input[1])
  edges[input[1]].insert(input[0])
}

for i in 1...n {
  result.append(bfs(i))
}

let minimum = result.min()!
print(
  result.enumerated()
    .compactMap { (index, value) in
      value == minimum ? index : nil
    }.sorted()
    .first! + 1
)

func bfs(_ start: Int) -> Int {
  var q = [start]
  var visited: Set<Int> = [start]
  var distances = Array(repeating: 0, count: n + 1)
  
  while !q.isEmpty {
    let current = q.removeFirst()
    
    for next in edges[current] {
      guard !visited.contains(next) else { continue }
      q.append(next)
      visited.insert(next)
      distances[next] = distances[current] + 1
    }
  }
  
  return distances.reduce(0, +)
}
