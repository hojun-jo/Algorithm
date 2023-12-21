import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, r, c) = (input[0], input[1], input[2])

print(recursive(n, r, c))

func recursive(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    
    let half = Int(pow(2.0, Double(n)) / 2)
    
    if r < half, c < half { return recursive(n - 1, r, c) }
    if r < half, c >= half { return half * half + recursive(n - 1, r, c - half)}
    if r >= half, c < half { return 2 * half * half + recursive(n - 1, r - half, c)}
    return 3 * half * half + recursive(n - 1, r - half, c - half)
}
