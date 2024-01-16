let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var counter = [Int : Int]()
var numberSet = [Int]()
var result = String()

for number in numbers {
    counter[number, default: 0] += 1
    if !numberSet.contains(number) {
        numberSet.append(number)
    }
}

numberSet.sort {
    if counter[$0]! != counter[$1]! {
        return counter[$0]! > counter[$1]!
    } else {
        return false
    }
}

for number in numberSet {
    for _ in 1...counter[number]! {
        result += "\(number) "
    }
}

print(result)
