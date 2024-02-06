let n = Int(readLine()!)!
var ropes = [Int]()
var result = 0

for _ in 1...n {
    ropes.append(Int(readLine()!)!)
}

ropes.sort()

for i in 1...n {
    result = max(result, ropes[n - i] * i)
}

print(result)
