import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var result = 0
    var stack = [Int]()
    
    for i in ingredient {
        stack.append(i)
        
        if i == 1 {
            var tmp = [Int]()
            var count = 0
            
            while let last = stack.popLast() {
                count += 1
                tmp.append(last)
                
                if count == 4 {
                    break
                }
            }
            
            tmp.reverse()
            
            if tmp == [1, 2, 3, 1] {
                result += 1
            } else {
                stack += tmp
            }
        }
    }
    
    return result
}
