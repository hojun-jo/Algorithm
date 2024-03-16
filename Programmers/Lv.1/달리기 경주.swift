import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var dict = [String : Int]()
    
    for (index, player) in players.enumerated() {
        dict[player] = index
    }
    
    for player in callings {
        let overtaking = dict[player]!
        dict[player]! -= 1
        dict[players[overtaking - 1]]! += 1
        players.swapAt(overtaking, overtaking - 1)
    }
    
    return players
}
