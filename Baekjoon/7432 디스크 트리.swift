var tree = Array(repeating: [String : Int](), count: 80 * 500 + 5)
var next = 1
var result = ""

for _ in 0..<Int(readLine()!)! {
    insert(readLine()!)
}

recursion(tree[0], "")
print(result)

func insert(_ text: String) {
    let path = text.split(separator: "\\").map(String.init)
    var current = 0
    
    for folder in path {
        if tree[current][folder] == nil {
            tree[current][folder] = next
            next += 1
        }
        
        current = tree[current][folder]!
    }
}

func recursion(_ dictionary: [String : Int], _ indent: String) {
    for folder in dictionary.keys.sorted() {
        result += indent + folder + "\n"
        
        if let next = dictionary[folder] {
            recursion(tree[next], indent + " ")
        }
    }
}
