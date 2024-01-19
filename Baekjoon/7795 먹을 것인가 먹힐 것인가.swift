let n = Int(readLine()!)!
var result = String()

for _ in 1...n {
    _ = readLine()
    let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
    let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var count = 0
    
    for i in a {
        for j in b {
            guard i > j else { break }
            count += 1
        }
    }
    
    result += "\(count)\n"
}

print(result)
