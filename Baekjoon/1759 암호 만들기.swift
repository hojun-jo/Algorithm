let input = readLine()!.split(separator: " ").map { Int($0)! }
let alphabet = readLine()!.split(separator: " ").map(String.init).sorted()
var stack = [String]()
var using = Set<String>()
var result = String()

backtracking()
print(result)

func backtracking() {
    guard stack.count < input[0] else {
        if isValidNumber(stack) {
            result += "\(stack.joined())\n"
        }
        return
    }
  
    let last = stack.last ?? "0"
    
    for a in alphabet {
        guard using.contains(a) == false,
              last < a else { continue }
        
        stack.append(a)
        using.insert(a)
        backtracking()
        using.remove(a)
        stack.removeLast()
    }
}

func isValidNumber(_ input: [String]) -> Bool {
    let inputSet = Set(input)
    let vowel: Set = ["a", "e", "i", "o", "u"]
    let countVowel = inputSet.intersection(vowel).count
    let countConsonant = inputSet.count - countVowel
    
    return countVowel >= 1 && countConsonant >= 2
}
