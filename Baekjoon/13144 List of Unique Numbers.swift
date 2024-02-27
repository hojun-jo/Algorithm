let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var using = Array(repeating: false, count: 100_001)
var end = 0
var count = 0

for start in 0..<n {
    while end < n {
        if using[numbers[end]] {
            using[numbers[start]] = false
            break
        } else {
            using[numbers[end]] = true
            end += 1
            count += end - start
        }
    }
}

print(count)
