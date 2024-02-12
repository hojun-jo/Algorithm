let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)

dp[0] = numbers[0]

for i in 1..<n {
    dp[i] = max(numbers[i], dp[i - 1] + numbers[i])
}

print(dp.max()!)
