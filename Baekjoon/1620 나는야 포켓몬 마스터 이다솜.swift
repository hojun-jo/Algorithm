let nm = readLine()!.split(separator: " ").map { Int($0)! }
var dictStringKey = [String : Int]()
var dictIntKey = [Int : String]()
var result = String()

for i in 1...nm[0] {
    let name = readLine()!
    dictStringKey[name] = i
    dictIntKey[i] = name
}

for _ in 1...nm[1] {
    let input = readLine()!
    if let value = dictStringKey[input] {
        result += String(value) + "\n"
    } else {
        result += dictIntKey[Int(input)!]! + "\n"
    }
}

print(result)
