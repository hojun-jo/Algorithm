let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
let sequence = readLine()!.split(separator: " ").map { Int(String($0))! }
var count = 0

compute(0, 0)
if ns[1] == 0 { count -= 1 }
print(count)

func compute(_ index: Int, _ total: Int) {
    if index == ns[0] {
        if total == ns[1] {
            count += 1
        }
        return
    }
    
    compute(index + 1, total)
    compute(index + 1, total + sequence[index])
}
