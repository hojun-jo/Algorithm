let n = Int(readLine()!)!
var inputs: [[String]] = []

for _ in 1...n {
    inputs.append(readLine()!.split(separator: " ").map { String($0) })
}

inputs.forEach { input in
    let str1 = Array(input[0]).sorted()
    let str2 = Array(input[1]).sorted()
    
    if str1 == str2 {
        print("Possible")
    } else {
        print("Impossible")
    }
}
