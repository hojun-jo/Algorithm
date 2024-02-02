let n = Int(readLine()!)!
var dp = Array(repeating: (count: 0, values: [1]), count: n + 1)

if n > 1 {
    for i in 2...n {
        dp[i] = (dp[i - 1].count + 1, dp[i - 1].values + [i])
        
        if i % 2 == 0,
           dp[i / 2].count + 1 < dp[i].count{
            dp[i] = (dp[i / 2].count + 1, dp[i / 2].values + [i])
        }
        
        if i % 3 == 0,
           dp[i / 3].count + 1 < dp[i].count {
            dp[i] = (dp[i / 3].count + 1, dp[i / 3].values + [i])
        }
    }
}

print("\(dp[n].count)\n\(dp[n].values.reversed().map(String.init).joined(separator: " "))")
