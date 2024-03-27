let testCases = Int(readLine()!)!
var result = String()

for _ in 1...testCases {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    
    for _ in 1...m {
        readLine()
    }
    
    result += "\(n - 1)\n" // 같은 간선은 같은 비행기
}

print(result)
