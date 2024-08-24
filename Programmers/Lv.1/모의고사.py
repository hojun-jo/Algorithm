def solution(answers):
    answer = []
    scores = [0, 0, 0]
    pattern1 = [1, 2, 3, 4, 5]
    pattern2 = [2, 1, 2, 3, 2, 4, 2, 5]
    pattern3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    for i, num in enumerate(answers):
        if num == pattern1[i%len(pattern1)]:
            scores[0] += 1
        if num == pattern2[i%len(pattern2)]:
            scores[1] += 1
        if num == pattern3[i%len(pattern3)]:
            scores[2] += 1
    
    for i, score in enumerate(scores):
        if score == max(scores):
            answer.append(i + 1)
    
    return answer
