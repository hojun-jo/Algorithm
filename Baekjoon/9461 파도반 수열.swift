let cases = Int(readLine()!)!
var p = [1, 1, 1, 2, 2, 3, 4, 5, 7, 9]
var result = String()

for _ in 1...cases {
    let n = Int(readLine()!)!
    
    if n >= p.count {
        for i in p.count..<n {
            p.append(p[i - 1] + p[i - 5])
        }
    }
    
    result += String(p[n - 1]) + "\n"
}

print(result)
