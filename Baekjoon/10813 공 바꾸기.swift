let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numberOfBasket = input[0]
let numberOfChange = input[1]
var baskets: [Int] = []

for i in 0...numberOfBasket {
    baskets.append(i)
}

for _ in 1...numberOfChange {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let tmp = baskets[input2[0]]
    baskets[input2[0]] = baskets[input2[1]]
    baskets[input2[1]] = tmp
}

for i in 1...numberOfBasket {
    print(baskets[i], terminator: " ")
}
