let height = Int(readLine()!)!

print(makeStars(height: height).joined(separator: "\n"))

func makeStars(height: Int) -> [String] {
    guard height > 1 else { return ["*"] }
    
    let stars = makeStars(height: height / 2)
    let space = String(repeating: " ", count: height / 2)
    var result = [String]()
    
    if height == 3 {
        stars.forEach { result.append(space + space + $0 + space + space) }
        stars.forEach { result.append(space + $0 + space + $0 + space) }
        stars.forEach { result.append($0 + $0 + $0 + $0 + $0) }
    } else {
        stars.forEach { result.append(space + $0 + space) }
        stars.forEach { result.append($0 + makeShort(space, n: height - 2) + $0) }
    }
    
    return result
}

func makeShort(_ str: String, n: Int) -> String {
    let source = str.map(String.init)
    var result = [String]()
    for i in 0...str.count / n {
        result.append(source[i])
    }
    return result.joined()
}
