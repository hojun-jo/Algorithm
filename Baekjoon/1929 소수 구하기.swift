let mn = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: true, count: mn[1] + 1)
var result = String()

arr[1] = false

for i in 2...mn[1] {
    guard arr[i] == true else { continue }
    
    for j in stride(from: i * i, through: mn[1], by: i) {
        arr[j] = false
    }
}

for i in mn[0]...mn[1] {
    if arr[i] == true {
        result += String(i) + "\n"
    }
}

print(result)
