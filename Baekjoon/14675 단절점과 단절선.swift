let n = Int(readLine()!)!
var edges = Array(repeating: [Int](), count: n + 1)
var result = String()

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}

let q = Int(readLine()!)!

for _ in 1...q {
    let query = readLine()!.split(separator: " ").map { Int($0)! }

    if query[0] == 2 {
        result += "yes\n"
    } else {
        result += edges[query[1]].count >= 2 ? "yes\n" : "no\n"
    }
}

print(result)
