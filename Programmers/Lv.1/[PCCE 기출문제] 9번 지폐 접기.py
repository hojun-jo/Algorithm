def solution(wallet, bill):
    answer = 0
    current_bill = bill
    
    while need_half(wallet, current_bill):
        current_bill = make_half(current_bill)
        answer += 1
    
    return answer

def make_half(bill):
    if (bill[0] >= bill[1]):
        return [bill[0] // 2, bill[1]]
    return [bill[0], bill[1] // 2]

def need_half(wallet, bill):
    if (bill[0] <= wallet[0] and bill[1] <= wallet[1]):
        return False
    if (bill[1] <= wallet[0] and bill[0] <= wallet[1]):
        return False
    return True
