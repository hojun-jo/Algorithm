_ = readLine()
var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let b = readLine()!.split(separator: " ").map { Int($0)! }
var indices = Set<Int>()
var result = String()

for target in b {
    if let index = binarySearch(target) {
        indices.insert(index)
    }
}

result = String(a.count - indices.count) + "\n"

for i in 0..<a.count {
    if indices.contains(i) { continue }
    
    result += String(a[i]) + " "
}

print(result)

func binarySearch(_ target: Int) -> Int? {
    var start = 0
    var end = a.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if a[mid] == target {
            return mid
        } else if a[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return nil
}
