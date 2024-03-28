var result = String()
var caseCount = 1

while let input = readLine(), input != "0 0" {
  let nm = input.split(separator: " ").map { Int($0)! }
  let n = nm[0], m = nm[1]
  var edges = Array(repeating: [Int](), count: n + 1)
  
  for _ in 1..<m + 1 {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    edges[link[0]].append(link[1])
    edges[link[1]].append(link[0])
  }
  
  switch dfs() {
  case 0:
    result += "Case \(caseCount): No trees.\n"
  case 1:
    result += "Case \(caseCount): There is one tree.\n"
  case let count:
    result += "Case \(caseCount): A forest of \(count) trees.\n"
  }
  
  caseCount += 1
  
  func dfs() -> Int {
    var stack = [(node: Int, parent: Int)]()
    var visited = Set<Int>()
    var count = 0
    
    loop: for i in 1...n {
      guard visited.contains(i) == false else { continue }
      
      count += 1
      stack.append((i, 0))
      visited.insert(i)
      
      while let (current, parent) = stack.popLast() {
        for next in edges[current] {
          if visited.contains(next),
             next != parent {
            count -= 1
            stack.removeAll()
            continue loop
          }
          guard visited.contains(next) == false else { continue }
          
          stack.append((next, current))
          visited.insert(next)
        }
      }
    }
    
    return count
  }
}

print(result)
