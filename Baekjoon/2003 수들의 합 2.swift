let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = 0
var sum = numbers[0]
var count = 0

loop: while start <= end || end < n {
    switch sum {
    case m:
        count += 1
        fallthrough
    case ..<m:
        end += 1
        guard end < n else { break loop }
        sum += numbers[end]
    default:
        sum -= numbers[start]
        start += 1
    }
}

print(count)
