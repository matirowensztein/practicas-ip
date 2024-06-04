from queue import LifoQueue as Pila

def cantidad_elementos(p: Pila) -> int:
    res: int = 0
    valores: Pila = Pila()
    
    while not p.empty():
        valores.put(p.get())
        res += 1

    while not valores.empty():
        p.put(valores.get())

    return res

