import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String : Int]()
    
    clothes.forEach {
        dict[$0[1], default: 1] += 1
    }
    
    return dict.values.reduce(1, *) - 1
}
