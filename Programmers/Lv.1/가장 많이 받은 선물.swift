import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
  var nextGiftCount = [String : Int]()
  var currentGiftCount = [String : Int]()
  var giftIndex = [String : Int]()
  var atob = [String : [String : Int]]()
  
  for exchanging in gifts {
    let input = exchanging.split(separator: " ").map(String.init)
    atob[input[0], default: [input[1] : 0]][input[1], default: 0] += 1
    currentGiftCount[input[1], default: 0] += 1
  }
  
  for person in atob {
    let name = person.key
    var result = 0
    for friend in person.value {
      result += friend.value
    }
    giftIndex[name] = result - (currentGiftCount[name] ?? 0)
  }
  
  for i in 0..<friends.count {
    for j in i + 1..<friends.count {
      let a = friends[i]
      let b = friends[j]
      
      if atob[a]?[b] ?? 0 == atob[b]?[a] ?? 0 {
        if giftIndex[a] == giftIndex[b] {
          continue
        } else if giftIndex[a] ?? 0 > giftIndex[b] ?? 0 {
          nextGiftCount[a, default: 0] += 1
        } else {
          nextGiftCount[b, default: 0] += 1
        }
      } else if atob[a]?[b] ?? 0 > atob[b]?[a] ?? 0 {
        nextGiftCount[a, default: 0] += 1
      } else {
        nextGiftCount[b, default: 0] += 1
      }
    }
  }
  
  return nextGiftCount.values.max() ?? 0
}
