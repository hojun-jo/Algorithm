let n = Int(readLine()!)!
var users = [(age: Int, name: String)]()
var result = String()

for _ in 1...n {
    let line = readLine()!.split(separator: " ").map(String.init)
    users.append((Int(line[0])!, line[1]))
}

users.sort {
    return $0.age < $1.age
}

for user in users {
    result += "\(user.age) \(user.name)\n"
}

print(result)
