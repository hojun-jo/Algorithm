let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }
var deque = Array(1...input[0])
var result = 0

for target in targets {
    if target == deque.first {
        deque.removeFirst()
    } else {
        var frontDeque = deque
        var countFromFront = 0
        while target != frontDeque.first {
            frontDeque.append(frontDeque.removeFirst())
            countFromFront += 1
        }
        
        var backDeque = deque
        var countFromBack = 0
        while target != backDeque.first {
            backDeque.insert(backDeque.removeLast(), at: 0)
            countFromBack += 1
        }
        
        result += countFromFront < countFromBack ? countFromFront : countFromBack
        deque = countFromFront < countFromBack ? frontDeque : backDeque
        deque.removeFirst()
    }
}

print(result)
