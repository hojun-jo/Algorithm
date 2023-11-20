import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageInUsers = Array(repeating: 0.0, count: N + 2)
    for stage in stages {
        stageInUsers[stage] += 1
    }
    
    for i in 0...N + 1 {
        if stageInUsers[i] == 0 {
            continue
        }
        
        var count = 0.0
        for j in i...N + 1 {
            count += stageInUsers[j]
        }
        
        stageInUsers[i] /= count
    }

    let sorted = stageInUsers.enumerated().sorted {
        $0.1 > $1.1
    }

    var result = [Int]()
    for (stage, failRate) in sorted {
        if stage != 0,
           stage <= N {
            result.append(stage)
        }
    }
    
    return result
}
