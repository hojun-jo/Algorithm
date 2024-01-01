let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var array = Array(repeating: 0, count: 9)
var isUsed = Array(repeating: false, count: 9)
var result = String()

compute(0)
print(result)

func compute(_ num: Int) {
    if num == m {
        for i in 0...m - 1 {
            result += "\(array[i]) "
        }
        result += "\n"
        return
    }
    
    for i in 1...n {
        if !isUsed[i] {
            array[num] = i
            isUsed[i] = true
            compute(num + 1)
            isUsed[i] = false
        }
    }
}
