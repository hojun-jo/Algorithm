from collections import Counter

def solution(nums):
    need = len(nums) / 2
    counts = Counter(nums)
    answer = len(counts.keys())
    
    if answer > need:
        answer = need
    
    return answer
