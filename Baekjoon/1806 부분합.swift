let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var end = 0
var length = Int.max
var sum = numbers[0]

for start in 0..<n {
    while end < n - 1,
        sum < m {
            end += 1
            sum += numbers[end]
        }
    
    if sum >= m {
        length = min(length, end - start + 1)
    }
    
    sum -= numbers[start]
}

print(length == Int.max ? 0 : length)
