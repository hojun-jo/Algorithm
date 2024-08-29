def solution(n, wires):
    answer = 100
    graph = [[] for _ in range(n + 1)]
    
    for start, end in wires:
        graph[start].append(end)
        graph[end].append(start)
    
    for start, end in wires:
        visited = [False] * (n + 1)
        one_side = count_towers(start, end, visited, graph)
        other_side = abs(n - one_side)
        difference = abs(one_side - other_side)
        answer = min(answer, difference)
        
    return answer

def count_towers(start, end, visited, graph):
    visited[start] = True
    visited[end] = True
    stack = [end]
    count = 1
    
    while stack:
        current = stack.pop()
        
        for next in graph[current]:
            if not visited[next]:
                stack.append(next)
                visited[next] = True
                count += 1
    
    return count
