let cases = Int(readLine()!)!
var result = String()

for _ in 1...cases {
    let n = Int(readLine()!)!
    let prices = Array(readLine()!.split(separator: " ").map { Int($0)! }.reversed())
    
    var max = 0
    var sum = 0
    
    for i in 0..<n {
        if prices[i] > max {
            max = prices[i]
        } else {
            sum += max - prices[i]
        }
    }
    
    result += String(sum) + "\n"
}

print(result)
