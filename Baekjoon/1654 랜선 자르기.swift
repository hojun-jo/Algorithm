let kn = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (kn[0], kn[1])
var arr = [Int]()
var start = 1
var end = 0x7fffffff

for _ in 1...k {
    arr.append(Int(readLine()!)!)
}

while start < end {
    let mid = (start + end + 1) / 2
    
    if solve(mid) {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)

func solve(_ x: Int) -> Bool {
    var current = 0
    for i in 0..<k {
        current += arr[i] / x
    }
    return current >= n
}
