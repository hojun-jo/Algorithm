let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = Int(readLine()!)!
var result = 0

array.forEach {
    if $0 == v {
        result += 1
    }
}

print(result)
