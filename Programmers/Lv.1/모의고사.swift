import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var student1 = [1, 2, 3, 4, 5]
    var student2 = [2, 1, 2, 3, 2, 4, 2, 5]
    var student3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    let count1 = student1.count
    let count2 = student2.count
    let count3 = student3.count
    let answersCount = answers.count
    
    if count1 < answersCount {
        student1 = Array(repeating: student1, count: Int(ceil(Double(answersCount) / Double(count1)))).flatMap { $0 }
    }
    if count2 < answersCount {
        student2 = Array(repeating: student2, count: Int(ceil(Double(answersCount) / Double(count2)))).flatMap { $0 }
    }
    if count3 < answersCount {
        student3 = Array(repeating: student3, count: Int(ceil(Double(answersCount) / Double(count3)))).flatMap { $0 }
    }
    
    var answer1 = 0
    var answer2 = 0
    var answer3 = 0
    for i in 0...answersCount - 1 {
        if student1[i] == answers[i] {
            answer1 += 1
        }
        if student2[i] == answers[i] {
            answer2 += 1
        }
        if student3[i] == answers[i] {
            answer3 += 1
        }
    }
    
    let array = [answer1, answer2, answer3]
    let max = array.max()
    var result = [Int]()
    for i in 1...3 {
        if array[i - 1] == max {
            result.append(i)
        }
    }
    
    return result
}
