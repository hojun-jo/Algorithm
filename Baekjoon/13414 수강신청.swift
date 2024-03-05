let kl = readLine()!.split(separator: " ").map { Int($0)! }
let (k, l) = (kl[0], kl[1])
var dict = [String : Int]()
var result = String()

for i in 1...l {
    dict[readLine()!] = i
}

var sortedDict = dict.sorted{ $0.value < $1.value }
for i in 0..<k {
    guard sortedDict.count > i else { break }
    result += sortedDict[i].key + "\n"
}

print(result)
