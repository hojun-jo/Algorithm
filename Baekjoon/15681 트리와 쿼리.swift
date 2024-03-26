let nrq = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrq[0], r = nrq[1], q = nrq[2]
var edges = Array(repeating: [Int](), count: n + 1)
var visited = Set<Int>()
var subtreeCount = [Int : Int]()
var result = String()

for _ in 1..<n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].append(input[1])
  edges[input[1]].append(input[0])
}

dfs(r)

for _ in 1...q {
  let query = Int(readLine()!)!
  result += String(subtreeCount[query]!) + "\n"
}

print(result)

func dfs(_ node: Int) -> Int {
  var count = 1
  visited.insert(node)
  
  for next in edges[node] {
    guard visited.contains(next) == false else { continue }
    
    count += dfs(next)
  }
  
  subtreeCount[node] = count
  
  return count
}
