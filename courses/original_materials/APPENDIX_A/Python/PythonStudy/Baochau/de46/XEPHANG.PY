def ban_co_chieu_cao_lonnhat(chieucaos):
    chieucao_count = {}
    for i in chieucaos:
        if i in chieucao_count:
            chieucao_count[i] += 1
        else:
            chieucao_count[i] = 1
    chieucao_ln = max(chieucao_count, key = chieucao_count.get)
    count_ln = chieucao_count[chieucao_ln]
    return chieucao_ln, count_ln

def main():
    with open('XEPHANG.INP', 'r') as file:
        n = int(file.readline().strip())
        chieucao = list(map(int, file.readline().strip().split()))
        
    chieucao_ln, count_ln = ban_co_chieu_cao_lonnhat(chieucao)

    with open('XEPHANG.OUT', 'w') as file:
        while count_ln > 0:
            file.write(f'{chieucao_ln} {count_ln}\n')
            chieucao = [j for j in chieucao if j != chieucao_ln]
            chieucao_ln, count_ln = ban_co_chieu_cao_lonnhat(chieucao)
            
if __name__ == '__main__':
    main()