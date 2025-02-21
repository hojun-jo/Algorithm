def solution(schedules, timelogs, startday):
    answer = 0
    currentday = startday
    
    for i in range(len(timelogs)):
        success = 0
        limit = to_limit(schedules[i])
        
        for j in range(len(timelogs[0])):
            if (currentday != 6 and currentday != 7):
                if (timelogs[i][j] <= limit):
                    success += 1

            currentday = to_next_day(currentday)

        currentday = startday

        if (success == 5):
            answer += 1
    
    return answer

def to_limit(time):
    hour = time // 100
    minute = time % 100 + 10
    
    if (minute >= 60):
        hour += 1
        minute = minute % 60
    
    return hour * 100 + minute

def to_next_day(day):
    nextday = day + 1
    if (nextday > 7):
        return 1
    return nextday
