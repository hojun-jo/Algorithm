import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let dungeonCount = dungeons.count
    var stack = [Int]()
    var using = Set<Int>()
    var counts = [Int]()
    var currentK = k
    
    func backtracking() {
        guard stack.count < dungeonCount else {
            counts.append(dungeonCount)
            return
        }
        
        for i in 0..<dungeonCount {
            guard !using.contains(i) else { continue }
            guard currentK >= dungeons[i][0] else {
                counts.append(using.count)
                continue
            }
            
            stack.append(i)
            using.insert(i)
            
            currentK -= dungeons[i][1]
            
            backtracking()
            
            currentK += dungeons[i][1]
            
            using.remove(i)
            stack.removeLast()
        }
    }
    
    backtracking()
    
    return counts.max()!
}
