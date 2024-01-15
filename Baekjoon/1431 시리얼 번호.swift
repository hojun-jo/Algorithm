let n = Int(readLine()!)!
var serials = [String]()
var result = String()

for _ in 1...n {
    serials.append(readLine()!)
}

serials.sort {
    if $0.count != $1.count {
        return $0.count < $1.count
    } else if let lhs = sumNumber($0),
              let rhs = sumNumber($1),
              lhs != rhs {
        return lhs < rhs
    } else {
        return $0 < $1
    }
}

for serial in serials {
    result += "\(serial)\n"
}

print(result)

func sumNumber(_ text: String) -> Int? {
    var sum = 0
    for char in text.map(String.init) {
        guard let num = Int(char) else { continue }
        sum += num
    }
    return sum
}
