let n = Int(readLine()!)!
var numbers = [Int]()
var two = [Int]()

for _ in 1...n {
    numbers.append(Int(readLine()!)!)
}

for i in 0..<n {
    for j in i..<n {
        two.append(numbers[i] + numbers[j])
    }
}

numbers.sort()
two.sort()
var length = two.count

loop: for i in stride(from: n - 1, through: 0, by: -1) {
    for j in 0..<n {
        let difference = numbers[i] - numbers[j]
        
        if binarySearch(difference) != nil {
            print(numbers[i])
            break loop
        }
    }
}

func binarySearch(_ target: Int) -> Int? {
    var start = 0
    var end = length
    
    while start <= end {
        let mid = (start + end) / 2
        
        if two[mid] == target {
            return mid
        } else if two[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return nil
}
