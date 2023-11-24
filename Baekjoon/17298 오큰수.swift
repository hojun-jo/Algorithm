let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0)! }
var result = Array(repeating: -1, count: n)
var stack = [Int]()

for (index, number) in numbers.enumerated() {
    while let last = stack.last,
    numbers[last] < number {
        let idx = stack.removeLast()
        result[idx] = number
    }
    
    stack.append(index)
}

print(result.map(String.init).joined(separator: " "))
