import Foundation

func solution(_ new_id:String) -> String {
    let step1 = new_id.lowercased()
    var step2 = step1.map(String.init)
    
    for i in 0...step2.count - 1 {
        guard step2[i] >= "a" && step2[i] <= "z"
        || step2[i] >= "0" && step2[i] <= "9"
        || step2[i] == "-"
        || step2[i] == "_"
        || step2[i] == "."
        else {
            step2[i] = ""
            continue
        }
    }
    
    var step3 = [String]()
    
    for char in step2.joined() {
        if step3.last == "." && char == "." {
            continue
        } else {
            step3.append(String(char))
        }
    }
    
    var step4 = step3
    
    if step4.first == "." {
        step4[0] = ""
    }
    if step4.last == "." {
        step4.removeLast()
    }
    
    var step5 = step4.joined()
    
    if step5.isEmpty {
        step5 = "a"
    }
    
    var step6 = step5
    
    if step6.count >= 16 {
        step6.removeLast(step6.count - 15)
        
        if step6.last == "." {
            step6.removeLast()
        }
    }
    
    var step7 = step6
    
    if step7.count <= 2 {
        let last = step7.last!
        
        while step7.count < 3 {
            step7 += String(last)
        }
    }

    return step7
}
