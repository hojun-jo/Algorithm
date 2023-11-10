let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let numberOfBasket = input1[0]
let numberOfChange = input1[1]
var array: [Int] = []

for i in 0...numberOfBasket {
    array.append(i)
}

for _ in 1...numberOfChange {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    var reversedArray = Array(array[input2[0]...input2[1]]).reversed()
    
    for (index, element) in zip(input2[0]...input2[1], reversedArray) {
        array[index] = element
    }
}

for i in 1...numberOfBasket {
    print(array[i], terminator: " ")
}
