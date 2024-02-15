for _ in 1...Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, x, y) = (input[0], input[1], input[2], input[3])
    var calendar = (x: x, y: x % n == 0 ? n : x % n)
    var count = x
    
    while calendar.y != y {
        guard count <= lcm(m, n) else { break }
        
        let currentY = (calendar.y + m) % n
        calendar.y = currentY == 0 ? n : currentY
        count += m
    }
    
    if calendar.y == y {
        print(count)
    } else {
        print(-1)
    }
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while (b != 0) {
        let tmp = a % b
        a = b
        b = tmp
    }
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
