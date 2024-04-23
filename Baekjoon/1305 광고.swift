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

_ = readLine()
let text = Array(readLine()!)
let failure = getFailure(of: text)
print(text.count - failure.last!)
