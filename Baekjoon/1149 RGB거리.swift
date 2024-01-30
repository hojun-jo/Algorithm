let n = Int(readLine()!)!
let (red, green, blue) = (0, 1, 2)
var costs = [[Int]]()

for _ in 1...n {
    costs.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1..<n {
    costs[i][red] += min(costs[i - 1][green], costs[i - 1][blue])
    costs[i][green] += min(costs[i - 1][red], costs[i - 1][blue])
    costs[i][blue] += min(costs[i - 1][green], costs[i - 1][red])
}

print(costs.last!.min()!)
