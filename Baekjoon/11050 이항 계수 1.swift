let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

print(re(n, k))

func re(_ n: Int, _ k: Int) -> Int {
    if k == 0 || n == k {
        return 1
    }
    return re(n - 1, k) + re(n - 1, k - 1)
}
