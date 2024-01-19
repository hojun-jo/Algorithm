let word = readLine()!
var words = [word]

for i in 1...word.count - 1 {
    words.append(String(word.dropFirst(i)))
}

words.sort()

print(words.joined(separator: "\n"))
