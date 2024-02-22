let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
_ = readLine()
let targets = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

loop: for target in targets {
    var start = 0
    var end = n - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if cards[mid] == target {
            result += String(1) + " "
            continue loop
        } else if cards[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    result += "0 "
}

print(result)
