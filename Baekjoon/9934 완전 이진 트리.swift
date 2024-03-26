let depth = Int(readLine()!)!
let order = readLine()!.split(separator: " ").map { Int($0)! }
var level = Array(repeating: [Int](), count: depth)
var result = String()

solution(start: 0, end: order.count - 1, depth: 0)

for i in 0..<level.count {
  result += level[i].map(String.init).joined(separator: " ") + "\n"
}

print(result)

func solution(start: Int, end: Int, depth: Int) {
  if start == end {
    level[depth].append(order[start])
    return
  }
  
  let root = (start + end) / 2
  level[depth].append(order[root])
  solution(start: start, end: root - 1, depth: depth + 1)
  solution(start: root + 1, end: end, depth: depth + 1)
}
