let n = Int(readLine()!)!
var inputs = [Int]()
var result = [Int]()

for _ in 1...n {
    inputs.append(Int(readLine()!)!)
}

for target in inputs {
    var numbers = [Int]()
    var using = Set<[Int]>()
    var count = 0
    backtracking(0)
    result.append(count)
    
    func backtracking(_ number: Int) {
        guard number < target else {
            if number == target {
                count += 1
            }
            return
        }
        
        for i in 1...3 {
            numbers.append(i)
            guard using.contains(numbers) == false else {
                numbers.removeLast()
                continue
            }
            
            using.insert(numbers)
            backtracking(number + i)
            using.remove(numbers)
            numbers.removeLast()
        }
    }
}

print(result.map(String.init).joined(separator: "\n"))
