from queue import Queue

def solution(numbers, target):
    answer = 0
    q = Queue()
    
    q.put((numbers[0], 0))
    q.put((numbers[0] * -1, 0))
    
    while q.empty() == False:
        current = q.get()
        next_index = current[1] + 1
        
        if next_index < len(numbers):
            plus = current[0] + numbers[next_index]
            minus = current[0] - numbers[next_index]
            
            q.put((plus, next_index))
            q.put((minus, next_index))
        else:
            if current[0] == target:
                answer += 1
    
    return answer
