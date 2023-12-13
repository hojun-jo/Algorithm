import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var (minX, minY, maxX, maxY) = (-1, -1, 0, 0)
    
    var x = 0
    for s in wallpaper {
        var y = 0
        for char in s {
            if char == "#" {
                if minX == -1 || minY == -1 {
                    minX = x
                    minY = y
                }
                
                minX = min(minX, x)
                minY = min(minY, y)
                maxX = max(maxX, x)
                maxY = max(maxY, y)
            }
            
            y += 1
        }
        
        x += 1
    }
    
    return [minX, minY, maxX+1, maxY+1]
}
