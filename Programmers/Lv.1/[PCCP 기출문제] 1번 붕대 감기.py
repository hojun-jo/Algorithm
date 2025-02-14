def solution(bandage, health, attacks):
    current = health
    continuous = 0
    time = 1
    
    for attack in attacks:
        while (time < attack[0]):
            continuous += 1
            
            if (continuous == bandage[0]):
                current = heal(current, bandage[1] + bandage[2], health)
                continuous = 0
            else:
                current = heal(current, bandage[1], health)
                
            time += 1
            
        current = attacked(current, attack[1])
        if (current == -1): return -1
        continuous = 0
        time += 1
        
    return current

def attacked(current, minus):
    if (current - minus <= 0):
        return -1
    else:
        return current - minus

def heal(current, plus, max_health):
    if (current + plus <= max_health):
        return current + plus
    else:
        return max_health
    
    
