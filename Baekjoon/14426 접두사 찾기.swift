let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let root = 1
let mx = 10000 * 500 + 5
var unused = 2
var next = Array(repeating: Array(repeating: -1, count: 26), count: mx)
var count = 0

for _ in 1...n {
    insert(readLine()!)
}

for _ in 1...m {
    if find(readLine()!) {
        count += 1
    }
}

print(count)

func insert(_ text: String) {
  var current = root
  for character in text {
    let characterInt = String(character).toInt()
    if next[current][characterInt] == -1 {
      unused += 1
      next[current][characterInt] = unused
    }
    current = next[current][characterInt]
  }
}

func find(_ text: String) -> Bool {
  var current = root
  for character in text {
    let characterInt = String(character).toInt()
    if next[current][characterInt] == -1 {
      return false
    }
    current = next[current][characterInt]
  }
  return true
}

extension String {
  func toInt() -> Int {
    return Int(UnicodeScalar(self)!.value) - Int(UnicodeScalar("a").value)
  }
}
