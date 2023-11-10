import Foundation

var girls: [Int : Int] = [1 : 0, 2 : 0, 3 : 0, 4 : 0, 5 : 0, 6 : 0]
var boys: [Int : Int] = [1 : 0, 2 : 0, 3 : 0, 4 : 0, 5 : 0, 6 : 0]
let n = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ in 1...n[0] {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if input[0] == 0 {
        girls[input[1]]! += 1
    } else {
        boys[input[1]]! += 1
    }
}

var girlsRoom = 0
var boysRoom = 0

girls.forEach { _, value in
    girlsRoom += Int(ceil(Double(value) / Double(n[1])))
}

boys.forEach { _, value in
    boysRoom += Int(ceil(Double(value) / Double(n[1])))
}

print(girlsRoom + boysRoom)
