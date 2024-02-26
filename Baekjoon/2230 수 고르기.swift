let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var numbers = [Int]()
var end = 0
var minimum = Int.max

for _ in 1...n {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

for start in 0..<n {
    if minimum == m {
        break
    }
    
    while end < n - 1,
        numbers[end] - numbers[start] < m {
            end += 1
        }
    
    if numbers[end] - numbers[start] >= m {
        minimum = min(minimum, numbers[end] - numbers[start])
    }
}

print(minimum)
