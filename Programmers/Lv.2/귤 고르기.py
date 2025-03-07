def solution(k, tangerine):
    answer = 0
    k = k
    tmp = {}
    
    for t in tangerine:
        if t in tmp:
            tmp[t] += 1
        else:
            tmp[t] = 1
    
    result = sorted(tmp.items(), key=lambda x: x[1], reverse=True)

    for (size, amount) in result:
        answer += 1
        k -= amount
        if (k <= 0): break
    
    return answer
