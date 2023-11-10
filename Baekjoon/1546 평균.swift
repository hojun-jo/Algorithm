let numberOfSubject = Double(readLine()!)!
let subjects = readLine()!.split(separator: " ").map { Int(String($0))! }
let max = subjects.max()!
var newScore: [Double] = []

subjects.forEach {
    newScore.append(Double($0) / Double(max) * 100.0)
}

var result = 0.0
newScore.forEach {
    result += $0
}

print(result / numberOfSubject)
