from queue import Queue

def solution(begin, target, words):
    if target not in words:
        return 0
    
    return bfs(begin, target, words)

def bfs(begin, target, words):
    q = Queue()
    visited = {}

    for word in words:
        visited[word] = False
    
    q.put((begin, 0))
    
    while q.empty() == False:
        current = q.get()
        
        if current[0] == target:
            return current[1]
        
        for word in words:
            if (visited[word] == False and
                    isValidConvert(current[0], word)):
                q.put((word, current[1] + 1))
                visited[word] = True
    
    return 0

def isValidConvert(a, b):
    count = 0
    
    for i in range(len(a)):
        if a[i] != b[i]:
            count += 1
    
    if count == 1:
        return True
    
    return False
