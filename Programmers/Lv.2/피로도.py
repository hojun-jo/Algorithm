answer = 0

def solution(k, dungeons):
    global answer
    visited = [False] * len(dungeons)
    backtracking(k, 0, dungeons, visited)
    return answer

def backtracking(k, count, dungeons, visited):
    global answer
    if count > answer:
        answer = count
    
    for i in range(len(dungeons)):
        if (not visited[i] and
                k >= dungeons[i][0]):
            visited[i] = True
            dfs(k - dungeons[i][1], count + 1, dungeons, visited)
            visited[i] = False
