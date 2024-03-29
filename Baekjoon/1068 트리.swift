let n = Int(readLine()!)!
let links = readLine()!.split(separator: " ").map { Int($0)! }
let target = Int(readLine()!)!
var edges = Array(repeating: [Int](), count: n)
var root = 0

for (node, parent) in links.enumerated() {
  if parent == -1 {
    root = node
    continue
  }
  
  if node == target ||
      parent == target {
    continue
  }
  
  edges[node].append(parent)
  edges[parent].append(node)
}

print(target == root ? 0 : dfs())

func dfs() -> Int {
  var stack = [(node: Int, parent: Int)]()
  var visited = Set<Int>()
  var leafCount = 0
  
  stack.append((root, -1))
  visited.insert(root)
  
  while let (current, parent) = stack.popLast() {
    if current == root,
       edges[current].isEmpty {
      return 1
    }
    
    if edges[current].count == 1,
       edges[current].first == parent {
      leafCount += 1
      continue
    }
    
    for next in edges[current] {
      guard visited.contains(next) == false,
            next != -1
      else {
        continue
      }
      
      stack.append((next, current))
      visited.insert(next)
    }
  }
  
  return leafCount
}
