func solution(_ a:Int, _ b:Int) -> String {
    let monthDay = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayOfTheWeek = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    var days = 0
    
    for i in 0...a - 1 {
        days += monthDay[i]
    }
    days += b - 1
    
    return dayOfTheWeek[days % 7]
}
