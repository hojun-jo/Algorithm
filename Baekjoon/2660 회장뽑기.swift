let n = Int(readLine()!)!
var edges = Array(repeating: Set<Int>(), count: n + 1)
var result = [Int]()

while let input = readLine(),
      input != "-1 -1" {
  let tmp = input.split(separator: " ").map { Int($0)! }
  edges[tmp[0]].insert(tmp[1])
  edges[tmp[1]].insert(tmp[0])
}

for i in 1...n {
  result.append(bfs(i))
}

let possibleScore = result.min()!
result = result.enumerated()
  .compactMap { (index, value) in
    value == possibleScore ? index : nil
  }

print(
  String(possibleScore) + " " + String(result.count) + "\n" +
  result.map{$0 + 1}.map(String.init).joined(separator: " ")
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
  
  return distances.max()!
}
