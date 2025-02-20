def solution(video_len, pos, op_start, op_end, commands):
    current = split_time(pos)
    video_length = split_time(video_len)
    op_start = split_time(op_start)
    op_end = split_time(op_end)
    
    for command in commands:
        if (command == "prev"):
            current = prev_ten(current, op_start, op_end)
        if (command == "next"):
            current = next_ten(current, op_start, op_end, video_length)
    
    return toMinute(current)

def split_time(time):
    result = time.split(":")
    minuteToSeconds = int(result[0]) * 60
    
    return minuteToSeconds + int(result[1])

def prev_ten(current, op_start, op_end):
    new = skip_op(current, op_start, op_end)
    new = new - 10
    
    if (new <= 0):
        return 0
    
    return skip_op(new, op_start, op_end)
    
def next_ten(current, op_start, op_end, video_len):
    new = skip_op(current, op_start, op_end)
    new = new + 10
    
    if (new >= video_len):
        return video_len
    
    return skip_op(new, op_start, op_end)
    
def skip_op(current, op_start, op_end):
    if (op_start <= current and current <= op_end):
        return op_end
    
    return current
    
def toMinute(time):
    minute = time // 60
    seconds = time % 60
    minuteString = ""
    secondsString = ""
    
    if (minute < 10):
        minuteString = f"0{minute}"
    else:
        minuteString = f"{minute}"
        
    if (seconds < 10):
        secondsString = f"0{seconds}"
    else:
        secondsString = f"{seconds}"
        
    return f"{minuteString}:{secondsString}"
