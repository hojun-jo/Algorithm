func solution(_ s:String) -> String {
    var input = s.split(separator: " ").map { Int($0)! }
    input.sort()
    
    return String(input.first!) + " " + String(input.last!)
}
