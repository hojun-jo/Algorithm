let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var counter = [Int: Int]()
var start = 0
var end = 0
var length = 0

while end < n {
    if counter[numbers[end]] ?? 0 >= k {
        while counter[numbers[end]]! >= k {
            counter[numbers[start]]! -= 1
            start += 1
        }
    } else {
        counter[numbers[end], default: 0] += 1
        end += 1
    }
    
    length = max(length, end - start)
}

print(length)
