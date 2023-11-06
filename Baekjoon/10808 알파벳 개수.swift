let alphabetDictionary = ["a" : 0, "b" : 1, "c" : 2, "d" : 3, "e" : 4, "f" : 5, "g" : 6, "h" : 7, "i" : 8, "j" : 9, "k" : 10, "l" : 11, "m" : 12, "n" : 13, "o" : 14, "p" : 15, "q" : 16, "r" : 17, "s" : 18, "t" : 19, "u" : 20, "v" : 21, "w" : 22, "x" : 23, "y" : 24, "z" : 25]
var alphabetArray = [Int](repeating: 0, count: 26)

let input = readLine()

input!.forEach { char in
    alphabetArray[alphabetDictionary[String(char)]!] += 1
}

alphabetArray.forEach {
    print($0, terminator: " ")
}
