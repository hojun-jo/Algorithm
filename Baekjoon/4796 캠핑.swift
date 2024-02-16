var i = 1
var result = String()

while let input = readLine()?.split(separator: " ").map { Int($0)! } {
    guard input != [0, 0, 0] else { break }

    let (l, p, v) = (input[0], input[1], input[2])
    
    result += "Case " + String(i) + ": " + String((v / p * l) + min(v % p, l)) + "\n"
    i += 1
}

print(result)
