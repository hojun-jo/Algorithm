let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var dictTeam = [String : [String]]()
var dictMember = [String : String]()
var result = String()

for _ in 1...n {
    let team = readLine()!
    
    for _ in 1...Int(readLine()!)! {
        let member = readLine()!
        
        dictTeam[team, default: []].append(member)
        dictMember[member] = team
    }
}

for _ in 1...m {
    let name = readLine()!
    let quiz = Int(readLine()!)!
    
    if quiz == 0 {
        result += dictTeam[name]!.sorted().joined(separator: " ") + "\n"
    } else {
        result += dictMember[name]! + "\n"
    }
}

print(result)
