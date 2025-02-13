def solution(board, h, w):
    answer = 0
    target = board[h][w]
    y = len(board)
    x = len(board[0])
    
    for dy, dx in next_index(h, w, y, x):
        if (target == board[h+dy][w+dx]):
            answer += 1
    
    return answer

def next_index(h, w, y, x):
    next_index = []
    
    for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
        ny = h + dy
        nx = w + dx
        if (ny >= 0 and ny < y and nx >= 0 and nx < x):
            next_index.append((dy, dx))
            
    return next_index
