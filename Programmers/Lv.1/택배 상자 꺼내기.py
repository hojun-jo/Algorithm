def solution(n, w, num):
    answer = 0
    warehouse = make_warehouse(n, w)
    
    h = num // w
    rest = num % w
    j = 0
    if rest > 0:
        h += 1
        if h % 2 == 0:
            j = w - rest
        else:
            j = rest - 1
    else:
        if h % 2 == 0:
            j = 0
        else:
            j = w - 1

    is_top = warehouse[len(warehouse)-1][j]
    if is_top:
        answer = len(warehouse) - h + 1
    else:
        answer = len(warehouse) - h
    
    return answer

def make_warehouse(n, w):
    warehouse = []
    
    for i in range(n // w):
        tmp = []
        for j in range(w):
            tmp.append(True)
        warehouse.append(tmp)
            
    rest = n % w
    if rest > 0:
        tmp = []
        if (n // w + 1) % 2 == 0:
            for i in range(w):
                if i < w - rest:
                    tmp.append(False)
                else:
                    tmp.append(True)
        else:
            for i in range(w):
                if i < rest:
                    tmp.append(True)
                else:
                    tmp.append(False)
        warehouse.append(tmp)
            
    return warehouse
