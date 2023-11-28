let n = Int(readLine()!)!
var queue = Array(repeating: 0, count: n * 2)
var head = 0
var tail = n

for i in 1...n {
    queue[i - 1] = i
}

for _ in stride(from: 1, through: n - 1, by: 1) {
    head += 1
    queue[tail] = queue[head]
    head += 1
    tail += 1
}

print(queue[tail - 1])
