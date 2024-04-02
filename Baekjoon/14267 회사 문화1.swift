let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let links = readLine()!.split(separator: " ").map { Int($0)! }
var edges = Array(repeating: [Int](), count: n + 1)
var scores = Array(repeating: 0, count: n + 1)
var stack = [1]

for i in 0..<n {
  if links[i] == -1 { continue }
  edges[links[i]].append(i + 1)
}

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  scores[input[0]] += input[1]
}

while let current = stack.popLast() {
  for next in edges[current] {
    scores[next] += scores[current]
    stack.append(next)
  }
}

print(scores[1...].map(String.init).joined(separator: " "))
