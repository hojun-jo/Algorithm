func solution(_ n:Int) -> Int {
    var isPrime = Array(repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    var result = 0
    
    for i in stride(from: 2, through: n, by: 1) {
        if isPrime[i] {
            result += 1
            
            for j in stride(from: i * i, through: n, by: i) {
                isPrime[j] = false
            }
        }
    }
    
    return result
}
