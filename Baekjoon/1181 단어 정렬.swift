let n = Int(readLine()!)!
var wordSet = Set<String>()

for _ in 1...n {
    wordSet.insert(readLine()!)
}

var words = wordSet.sorted()
words.sort { $0.count < $1.count }

print(words.joined(separator: "\n"))
