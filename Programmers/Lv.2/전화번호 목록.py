def solution(phone_book):
    hash_map = {}
    
    for phone in phone_book:
        hash_map[phone] = 1
    
    for phone in phone_book:
        tmp = ""
        
        for num in phone:
            tmp += num
            
            if tmp in hash_map and tmp != phone:
                return False

    return True
