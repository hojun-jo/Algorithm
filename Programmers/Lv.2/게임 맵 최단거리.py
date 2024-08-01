from queue import Queue

def solution(maps):
    answer = 100000
    n = len(maps[0]) - 1
    m = len(maps) - 1
    dxdy = [(-1, 0), (0, -1), (1, 0), (0, 1)]
    distance = maps
    q = Queue()
    
    q.put((0, 0))
    
    while q.empty() == False:
        current = q.get()
        
        if (current == (n, m) and
                answer > distance[m][n]):
            answer = distance[m][n]
        
        for dx, dy in dxdy:
            nx = current[0] + dx
            ny = current[1] + dy
            
            if (0 <= nx <= n and
                    0 <= ny <= m and
                    maps[ny][nx] == 1):
                distance[ny][nx] = distance[current[1]][current[0]] + 1
                q.put((nx, ny))
    
    if answer == 100000:
        answer = -1
    
    return answer
