from collections import defaultdict

def solution(tickets):
    answer = []
    path = ["ICN"]
    t_dict = defaultdict(list)
    
    for s, e in tickets:
        t_dict[s].append(e)
    
    for start in t_dict.keys():
        t_dict[start].sort(reverse = True)
        
    while path:
        current = path[-1]
        
        if current not in t_dict or len(t_dict[current]) == 0:
            answer.append(path.pop())
        else:
            path.append(t_dict[current].pop())
    
    return answer[::-1]
