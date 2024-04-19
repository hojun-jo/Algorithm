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
      failure[index] = 0
      index += 1
    } else {
      length = failure[length - 1]
    }
  }
  
  return failure
}

let text = Array(readLine()!).filter { $0.isLetter }
let target = Array(readLine()!)
let failure = getFailure(of: text)
var index = 0
var length = 0

while index < text.count {
  if text[index] == target[length] {
    index += 1
    length += 1
    
    if length == target.count {
      break
    }
  } else if length == 0 {
    index += 1
  } else {
    length = failure[length - 1]
  }
}

if length == target.count {
  print(1)
} else {
  print(0)
}
