let n = Int(readLine()!)!
var dp = [1, 3]

while dp.count < n {
    dp.append((dp[dp.count - 1] + dp[dp.count - 2] * 2) % 10_007)
}

print(dp[n - 1])
