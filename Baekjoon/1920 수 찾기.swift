_ = readLine()
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let length = arr.count
_ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for target in numbers {
    var start = 0
    var mid = length / 2
    var end = length - 1
    var isContain = false
    
    while start <= end {
        if arr[mid] == target {
            isContain = true
            break
        } else if arr[mid] < target {
            start = mid + 1
            mid += end - mid == 1 ? 1 : (end - mid) / 2
        } else {
            end = mid - 1
            mid /= 2
        }
    }
    
    if isContain {
        result += "1\n"
    } else {
        result += "0\n"
    }
}

print(result)
