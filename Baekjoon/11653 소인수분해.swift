var n = Int(readLine()!)!
var divider = 2
var result = String()

while divider * divider <= n {
    while n % divider == 0 {
        result += String(divider) + "\n"
        n /= divider
    }
    divider += 1
}

if n != 1 {
    result += String(n)
}

print(result)
