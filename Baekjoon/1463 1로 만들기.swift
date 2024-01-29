let n = Int(readLine()!)!
var distance = Array(repeating: 0, count: n + 1)

if n > 1 {
    for i in 2...n {
        distance[i] = distance[i - 1] + 1
        if i % 2 == 0 { distance[i] = min(distance[i / 2] + 1, distance[i]) }
        if i % 3 == 0 { distance[i] = min(distance[i / 3] + 1, distance[i]) }
    }
}

print(distance[n])
