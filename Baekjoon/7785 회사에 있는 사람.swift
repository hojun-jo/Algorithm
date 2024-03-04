let n = Int(readLine()!)!
var dict = [String : Bool]()
var result = [String]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ")
    dict[String(input[0])] = input[1] == "enter" ? true : false
}

for (key, value) in dict {
    if value == true {
        result.append(key)
    }
}

print(result.sorted(by: >).joined(separator: "\n"))
