final class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numberOfPeople = input[0]
let k = input[1]
var result = [Int]()

let head = Node(value: 1)
var pre: Node? = head
var now: Node? = pre
for i in stride(from: 2, through: numberOfPeople, by: 1) {
    now = Node(value: i)
    pre?.next = now
    pre = now
}
now?.next = head

var current: Node? = head
for _ in stride(from: 1, through: numberOfPeople, by: 1) {
    for _ in stride(from: 1, to: k, by: 1) {
        current = current?.next
    }
    result.append(current!.value)
    current?.value = current!.next!.value
    current?.next = current?.next?.next
}

let order = result.map(String.init).joined(separator: ", ")
print("<\(order)>")
