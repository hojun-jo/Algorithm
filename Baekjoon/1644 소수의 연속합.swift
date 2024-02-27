let n = Int(readLine()!)!
var primeNumbers = [Int]()
var e = Array(repeating: true, count: 4_000_001)

for i in 2..<4_000_001 {
    guard e[i] == true else { continue }
    
    primeNumbers.append(i)
    
    for j in stride(from: i * i, to: 4_000_001, by: i) {
        e[j] = false
    }
}

let primeNumbersCount = primeNumbers.count
var start = 0
var end = 0
var sum = primeNumbers[0]
var count = 0

while start <= end {
    if sum == n {
        count += 1
        end += 1
        guard end < primeNumbersCount else { break }
        sum += primeNumbers[end]
    } else if sum > n {
        sum -= primeNumbers[start]
        start += 1
    } else {
        end += 1
        guard end < primeNumbersCount else { break }
        sum += primeNumbers[end]
    }
}

print(count)
