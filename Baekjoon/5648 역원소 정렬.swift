var numbers = [Int]()
var input = readLine()!.split(separator: " ")
input.removeFirst()

for i in input {
    numbers.append(Int(String(i.reversed()))!)
}

while let input = readLine() {
    let arr = input.split(separator: " ")
    
    for i in arr {
        numbers.append(Int(String(i.reversed()))!)
    }
}

numbers.sort()

print(numbers.map(String.init).joined(separator: "\n"))
