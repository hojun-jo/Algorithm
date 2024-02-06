let nk = readLine()!.split(separator: " ").map { Int($0)! }
var target = nk[1]
var coins = [Int]()
var count = 0

for _ in 1...nk[0] {
    coins.append(Int(readLine()!)!)
}

for i in stride(from: nk[0] - 1, through: 0, by: -1) {
    guard target > 0 else { break }
    guard coins[i] <= target else { continue }
    
    let requiredCount = target / coins[i]
    count += requiredCount
    target -= requiredCount * coins[i]
}

print(count)
