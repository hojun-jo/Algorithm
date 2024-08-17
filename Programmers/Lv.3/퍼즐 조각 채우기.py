from queue import Queue

def solution(game_board, table):
    blank = 0
    piece = 1
    
    answer = 0
    game_board = find_block_pieces(game_board, blank)
    table = find_block_pieces(table, piece)

    for board in game_board:
        filled = False
        target = make_block(board)

        for block in table:
            tmp = make_block(block)

            for _ in range(4):
                tmp = rotate(tmp)

                if tmp == target:
                    filled = True
                    table.remove(block)
                    answer += count_pieces(tmp)
                    break
            
            if filled:
                break

    return answer

def find_block_pieces(board, flag):
    length = len(board)
    dxdy = [(0, -1), (1, 0), (0, 1), (-1, 0)]

    q = Queue()
    visited = [[False] * length for _ in range(length)]
    blocks = []

    for i in range(length):
        for j in range(length):
            if board[i][j] != flag or visited[i][j] == True:
                continue

            q.put((i, j))
            visited[i][j] = True
            block = []

            while q.empty() == False:
                y, x = q.get()
                block.append((y, x))

                for dx, dy in dxdy:
                    nx = x + dx
                    ny = y + dy

                    if (0 <= nx < length and
                            0 <= ny < length and
                            visited[ny][nx] == False and
                            board[ny][nx] == flag):
                        q.put((ny, nx))
                        visited[ny][nx] = True

            blocks.append(block)
    
    return blocks

def make_block(pieces):
    x_list, y_list = zip(*pieces)
    column, row = max(x_list) - min(x_list) + 1, max(y_list) - min(y_list) + 1
    block = [[0] * row for _ in range(column)]

    for i, j in pieces:
        i, j = i - min(x_list), j - min(y_list)
        block[i][j] = 1
    
    return block

def rotate(block):
    rotated = [[0] * len(block) for _ in range(len(block[0]))]

    for i in range(len(block)):
        for j in range(len(block[0])):
            if block[i][j] == 1:
                rotated[j][len(block) - 1 - i] = 1
    
    return rotated

def count_pieces(block):
    count = 0

    for line in block:
        for piece in line:
            if piece == 1:
                count += 1

    return count
