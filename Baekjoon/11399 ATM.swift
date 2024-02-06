let n = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var dp = [times[0]]

for i in 1..<n {
    dp.append(dp[i - 1] + times[0...i].reduce(0, +))
}

print(dp.last!)
