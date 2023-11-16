struct LinkedList<T> {
    final class Node {
        var value: T
        var next: Node?
        var prev: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    var head: Node?
    var tail: Node?
    
    mutating func insert(_ newValue: T) {
        let node = Node(value: newValue)
        
        guard let last = tail else {
            head = node
            tail = node

            return
        }
        
        let tmp = tail
        last.next = node
        tail = node
        node.prev = tmp
    }
}

let n = Int(readLine()!)
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var list = LinkedList<(Int, Int)>()
var result = [Int]()

for (index, value) in input.enumerated() {
    list.insert((index, value))
}
list.tail?.next = list.head
list.head?.prev = list.tail

var current: LinkedList.Node! = list.head
for _ in 1...input.count {
    var number = current.value.1
    result.append(current.value.0 + 1)
    current.prev?.next = current.next
    current.next?.prev = current.prev
    
    for _ in 1...abs(number) {
        if number > 0 {
            current = current.next
        } else {
            current = current.prev
        }
    }
}

result.forEach {
    print($0, terminator: " ")
}
