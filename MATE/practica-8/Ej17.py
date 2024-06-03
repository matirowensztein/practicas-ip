from queue import Queue as Cola

def n_pacientes_urgentes(c: Cola[tuple[int,str,str]]) -> int:
    res: int = 0
    copia: Cola[tuple[int,str,str]] = Cola()

    while not c.empty():
        curr = c.get()
        if curr[0] >= 1 and curr[0] <= 3:
            res += 1
        copia.put(curr)

    while not copia.empty():
        c.put(copia.get())

    return res

