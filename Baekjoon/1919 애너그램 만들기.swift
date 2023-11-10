var alphabetList1 = [Int](repeating: 0, count: 26)
var alphabetList2 = [Int](repeating: 0, count: 26)
let input1 = readLine()!
let input2 = readLine()!

for alphabet in input1 {
    let index = Int(UnicodeScalar(String(alphabet))!.value) - 97
    alphabetList1[index] += 1
}

for alphabet in input2 {
    let index = Int(UnicodeScalar(String(alphabet))!.value) - 97
    alphabetList2[index] += 1
}

var result = 0
for (a, b) in zip(alphabetList1, alphabetList2) {
    result += abs(a - b)
}

print(result)
