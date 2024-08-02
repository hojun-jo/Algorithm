from queue import Queue

def solution(n, computers):
    answer = 0
    visited = []
    q = Queue()
    
    for i in range(n):
        if i in visited:
            continue
        
        answer += 1
        q.put(i)
        visited.append(i)
        
        while q.empty() == False:
            current = q.get()
        
            for nx in range(n):
                if nx in visited:
                    continue
                
                if computers[current][nx] == 1:
                    q.put(nx)
                    visited.append(nx)
    
    return answer
