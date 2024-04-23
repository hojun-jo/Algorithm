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

var texts = [String]()
var result = String()

while let input = readLine(),
      input != "." {
  texts.append(input)
}

for text in texts {
  let failure = getFailure(of: Array(text))
  let count = text.count
  let last = failure.last!
  let tmp = count % (count - last) == 0 ?
  count / (count - last) :
  1
  result += "\(tmp)\n"
}

print(result)
