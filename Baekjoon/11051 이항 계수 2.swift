let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

for i in 1...n {
    for j in 0...k {
        if j == 0 || i == j {
            dp[i][j] = 1
        } else {
            dp[i][j] = (dp[i - 1][j] + dp[i - 1][j - 1]) % 10_007
        }
    }
}

print(dp[n][k])
