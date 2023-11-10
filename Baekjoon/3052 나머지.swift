var array: [Int] = []

for _ in 1...10 {
    let input = Int(readLine()!)!
    array.append(input % 42)
}

print(Array(Set(array)).count)
