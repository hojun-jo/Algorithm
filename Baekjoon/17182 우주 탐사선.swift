let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
var costs = [[Int]]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    costs.append(input)
}

for mid in 0..<n {
    for start in 0..<n {
        for target in 0..<n {
            costs[start][target] = min(costs[start][target], costs[start][mid] + costs[mid][target])
        }
    }
}

var result = [Int]()
var visited: Set = [k]
var last = k
var sum = 0

backtracking()
print(result.min()!)

func backtracking() {
    guard visited.count < n else {
        result.append(sum)
        return
    }
    
    for i in 0..<n {
        guard visited.contains(i) == false else { continue }
        let tmp = last
        
        sum += costs[last][i]
        visited.insert(i)
        last = i
        backtracking()
        last = tmp
        visited.remove(i)
        sum -= costs[last][i]
    }
}
