let nm = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: numbers.count + 1)
var result = String()

for i in 1...nm[0] {
    dp[i] = numbers[i - 1]
    dp[i] += dp[i - 1]
}

for _ in 1...nm[1] {
    let indices = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(dp[indices[1]] - dp[indices[0] - 1])\n"
}

print(result)
