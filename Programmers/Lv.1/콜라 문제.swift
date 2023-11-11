import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result = 0
    var tmp = 0
    var emptyBottle = n
    
    while emptyBottle >= a {
        let newBottle = (emptyBottle / a) * b
        tmp = emptyBottle % a
        emptyBottle = newBottle + tmp
        result += newBottle
    }
    
    return result
}
