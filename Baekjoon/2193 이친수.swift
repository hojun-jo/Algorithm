let n = Int(readLine()!)!
var dp = [1, 1]
var index = 2

while index < n {
    dp.append(dp[index - 1] + dp[index - 2])
    index += 1
}

print(dp[n - 1])
