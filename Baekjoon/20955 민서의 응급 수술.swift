let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = Array(repeating: Set<Int>(), count: n + 1)
var visited = Set<Int>()
var count = -1

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].insert(input[1])
  edges[input[1]].insert(input[0])
}

for i in 1...n {
  guard visited.contains(i) == false else { continue }
  
  count += 1
  dfs(i)
}

print(count)

func dfs(_ start: Int) {
  var stack = [(node: Int, parent: Int)]()
  stack.append((start, 0))
  visited.insert(start)
  
  while let (current, parent) = stack.popLast() {
    for next in edges[current] {
      if visited.contains(next),
         next != parent {
        count += 1
        edges[next].remove(current)
        edges[current].remove(next)
        continue
      }
      guard visited.contains(next) == false else { continue }
      
      stack.append((next, current))
      visited.insert(next)
    }
  }
}
