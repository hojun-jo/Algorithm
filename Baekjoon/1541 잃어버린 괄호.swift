let operands = readLine()!
    .split(separator: "-")
    .map {
        $0.split(separator: "+")
            .map { Int($0)! }
            .reduce(0, +)
    }
var result = operands.first!

for i in 1..<operands.count {
    result -= operands[i]
}

print(result)
