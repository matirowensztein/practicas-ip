from queue import Queue as Cola

def cantidad_elementos(p: Cola) -> int:
    res: int = 0
    valores: Cola = Cola()
    
    while not p.empty():
        valores.put(p.get())
        res += 1

    while not valores.empty():
        p.put(valores.get())

    return res

