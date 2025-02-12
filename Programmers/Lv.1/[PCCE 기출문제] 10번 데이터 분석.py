def solution(data, ext, val_ext, sort_by):
    answer = [[]]
  
    index = decide_index(ext)
    answer = list(filter(lambda e: e[index] < val_ext, data))
    
    index = decide_index(sort_by)
    answer = sorted(answer, key=lambda e: e[index])
    
    return answer

def decide_index(ext):
    if ext == "code":
        return 0
    if ext == "date":
        return 1
    if ext == "maximum":
        return 2
    if ext == "remain":
        return 3
