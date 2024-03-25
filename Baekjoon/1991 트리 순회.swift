let n = Int(readLine()!)!
var dict = [String : (leftChild: String?, rightChild: String?)]()
var result = String()

for _ in 1...n {
  let input = readLine()!.split(separator: " ").map(String.init)
  dict[input[0]] = (input[1] == "." ? nil : input[1], input[2] == "." ? nil : input[2])
}

preorder("A")
result += "\n"
inorder("A")
result += "\n"
postorder("A")
print(result)

func preorder(_ current: String) {
  result += current
  if let left = dict[current]?.leftChild { preorder(left) }
  if let right = dict[current]?.rightChild { preorder(right) }
}

func inorder(_ current: String) {
  if let left = dict[current]?.leftChild { inorder(left) }
  result += current
  if let right = dict[current]?.rightChild { inorder(right) }
}

func postorder(_ current: String) {
  if let left = dict[current]?.leftChild { postorder(left) }
  if let right = dict[current]?.rightChild { postorder(right) }
  result += current
}
