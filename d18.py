input = open('input18.txt')

strings = []
for line in input.read().split("\n"):
    strings.append(line)

def single_calc(t: str):
    t2 = t.replace('(','').replace(')','').split(' ')
    while '+' in t2:
        i = t2.index('+')
        t2[i-1] = str(int(t2[i-1]) + int(t2[i+1]))
        t2.pop(i)
        t2.pop(i)
    return str(eval(' '.join(t2)))

ans = 0

for line in strings:
    chunk = ''
    chunk_pos = 0
    for char in line:
        chunk += char
        if char == '(':
            chunk_pos += 1
        elif char == ')':
            opening_brace_loc = chunk.rfind('(', 0, chunk_pos)
            bracket_calc = single_calc(chunk[opening_brace_loc : chunk_pos+1])
            chunk = chunk[:opening_brace_loc] + bracket_calc
        else:
            chunk_pos += 1
    ans += int(single_calc(chunk))

print(ans)

