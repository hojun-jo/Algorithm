import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
  var userCount = [String : Set<String>]() // 누가 누구를 신고했는지
  var reportedCount = [String : Int]() // 신고 당한 횟수
  
  report.forEach {
    let input = $0.split(separator: " ").map(String.init)
    userCount[input[0], default: Set<String>()].insert(input[1])
  }
  
  userCount.forEach { user in
    user.value.forEach {
      reportedCount[$0, default: 0] += 1
    }
  }
  
  let reported = reportedCount.filter { $0.value >= k }
  var result = [String : Int]()
  
  id_list.forEach { user in
    reported.forEach {
      if userCount[user, default: Set<String>()].contains($0.key) {
        result[user, default: 0] += 1
      }
    }
  }
  
  return id_list.map { result[$0] ?? 0 }
}
