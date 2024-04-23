func getFailure<T: Equatable>(of array: [T]) -> [Int] {
  var failure = Array(repeating: 0, count: array.count)
  var length = 0
  var index = 1
  
  while index < array.count {
    if array[index] == array[length] {
      length += 1
      failure[index] = length
      index += 1
    } else if length == 0 {
      index += 1
    } else {
      length = failure[length - 1]
    }
  }
  
  return failure
}

let text = Array(readLine()!)
let target = Array(readLine()!)
let failure = getFailure(of: target)
var length = 0
var index = 0
var count = 0
var startIndices = [Int]()

while index < text.count {
  if text[index] == target[length] {
    length += 1
    index += 1
    
    if length == target.count {
      count += 1
      startIndices.append(index - length + 1)
      length = failure[length - 1]
    }
  } else if length == 0 {
    index += 1
  } else {
    length = failure[length - 1]
  }
}

print(
  String(count) + "\n" +
  startIndices.map(String.init).joined(separator: " ")
)
