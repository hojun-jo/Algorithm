func solution(_ s:String) -> Bool {
    var stack = [Character]()
    
    for char in s {
        if char == "(" {
            stack.append(char)
        } else if stack.isEmpty {
            return false
        } else {
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}
