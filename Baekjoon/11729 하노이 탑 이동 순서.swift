import Foundation

let n = Int(readLine()!)!
var result = String()

result += "\(pow(2, n) - 1)\n"
recursive(from: 1, to: 3, num: n)

func recursive(from: Int, to: Int, num: Int) {
    if num == 1 {
        result += "\(from) \(to)\n"
        return
    }
    
    recursive(from: from, to: 6 - from - to, num: num - 1)
    result += "\(from) \(to)\n"
    recursive(from: 6 - from - to, to: to, num: num - 1)
}

print(result)
