let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0], m = nm[1]
var dict = [String : String]()
var result = String()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    dict[input[0]] = input[1]
}

for _ in 1...m {
    result += dict[readLine()!]! + "\n"
}

print(result)
