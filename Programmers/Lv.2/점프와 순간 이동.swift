import Foundation

func solution(_ n:Int) -> Int 
{
    var count = 0
    var current = n
    
    while current > 0 {
        count += current % 2
        current /= 2
    }
    
    return count
}
