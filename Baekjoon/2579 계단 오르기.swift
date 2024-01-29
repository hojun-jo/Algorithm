let n = Int(readLine()!)!
var stair = [0]
var result = Array(repeating: Array(repeating: 0, count: n + 1), count: 3)

for _ in 1...n {
    stair.append(Int(readLine()!)!)
}

if n == 1 {
    print(stair[1])
} else if n == 2 {
    print(stair[1] + stair[2])
} else if n == 3 {
    print(max(stair[1] + stair[3], stair[2] + stair[3]))
} else {
    result[1][1] = stair[1]
    result[2][1] = 0
    result[1][2] = stair[2]
    result[2][2] = stair[2] + stair[1]
    
    for i in 3...n {
        result[1][i] = max(result[1][i - 2], result[2][i - 2]) + stair[i]
        result[2][i] = result[1][i - 1] + stair[i]
    }
    
    print(max(result[1][n], result[2][n]))
}
