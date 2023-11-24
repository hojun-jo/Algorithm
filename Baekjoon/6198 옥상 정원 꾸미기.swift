let numberOfTowers = Int(readLine()!)!
var heightOfTowers = [Int]()
var stack = [Int]()
var result = 0

for _ in 1...numberOfTowers {
    heightOfTowers.append(Int(readLine()!)!)
}

for tower in heightOfTowers {
    while let last = stack.last,
          last <= tower {
        stack.removeLast()
    }
    
    stack.append(tower)
    result += stack.count - 1
}

print(result)
