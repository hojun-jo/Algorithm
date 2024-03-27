let nq = readLine()!.split(separator: " ").map { Int($0)! }
let n = nq[0], q = nq[1]
var tree = Array(repeating: false, count: n + 1)
var result = String()

for _ in 1...q {
  let input = Int(readLine()!)!
  let computed = compute(input)
  
  if computed == 0 {
    tree[input] = true
    result += "0\n"
  } else {
    result += "\(computed)\n"
  }
}

print(result)

func compute(_ target: Int) -> Int {
  var already = [Int]()
  var current = target
  
  if tree[target] == true {
    already.append(target)
  }
  
  while current > 0 {
    current /= 2
    
    if tree[current] == true { already.append(current) }
  }
  
  return already.isEmpty ? 0 : already.min()!
}
