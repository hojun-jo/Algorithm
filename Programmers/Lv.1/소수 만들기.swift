import Foundation

func solution(_ nums:[Int]) -> Int {
    func isPrime(_ num: Int) -> Bool {
        var i = 2
        while i * i <= num {
            if num % i == 0 {
                return false
            }
            
            i += 1
        }
        
        return true
    }
    
    var answer = 0
    
    for i in stride(from: 0, to: nums.count - 2, by: 1) {
        for j in stride(from: i + 1, to: nums.count - 1, by: 1) {
            for k in stride(from: j + 1, to: nums.count, by: 1) {
                if isPrime(nums[i] + nums[j] + nums[k]) {
                    answer += 1
                }
            }
        }
    }

    return answer
}
