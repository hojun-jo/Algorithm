let n = Int(readLine()!)!
var students = [(name: String, korean: Int, english: Int, math: Int)]()
var result = String()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    students.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

students.sort {
    ($0.korean, $1.english, $0.math, $1.name) > ($1.korean, $0.english, $1.math, $0.name)
}

for student in students {
    result += "\(student.name)\n"
}

print(result)
