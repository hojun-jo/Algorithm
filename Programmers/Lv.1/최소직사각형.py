def solution(sizes):
    width = []
    height = []
    
    for card in sizes:
        width.append(max(card))
        height.append(min(card))
    
    return max(width) * max(height)
