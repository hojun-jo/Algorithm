alphabet = ["A", "E", "I", "O", "U"]
answer = 0
idx = -1

def solution(word):
    def dfs(count, s):
        global answer, idx
        
        if count <= 5:
            idx += 1
            if s == word:
                answer = idx
        else:
            return
        
        for i in range(5):
            dfs(count + 1, s + alphabet[i])
            
    dfs(0, "")
    
    return answer
