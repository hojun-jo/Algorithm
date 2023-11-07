let input = readLine()!
var counter = [Int](repeating: 0, count: 10)

input.forEach {
    counter[Int(String($0))!] += 1
}

counter[6] = (counter[6] + counter[9] + 1) / 2
counter[9] = 0

print(counter.max()!)
