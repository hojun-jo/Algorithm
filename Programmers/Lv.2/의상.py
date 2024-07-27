def solution(clothes):
    hash_map = {}
    answer = 1
    
    for clothe in clothes:
        if clothe[1] in hash_map:
            hash_map[clothe[1]].append(clothe[0])
        else:
            hash_map[clothe[1]] = [clothe[0]]
    
    for values in hash_map.values():
        answer *= len(values) + 1

    return answer - 1

'''
(N+1)(M+1) = NM + N + M + 1

NM: N과 M을 모두 사용하는 경우
N: N만 사용하는 경우
M: M만 사용하는 경우
1: 모두 사용하지 않는 경우
'''
