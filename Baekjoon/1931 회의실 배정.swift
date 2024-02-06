let n = Int(readLine()!)!
var schedules = [[Int]]()
var lastTime = 0
var count = 0

for _ in 1...n {
    schedules.append(readLine()!.split(separator: " ").map { Int($0)! })
}

schedules.sort {
    ($0[1], $0[0]) < ($1[1], $1[0])
}

for time in schedules {
    guard time[0] >= lastTime else { continue }
    
    count += 1
    lastTime = time[1]
}

print(count)
