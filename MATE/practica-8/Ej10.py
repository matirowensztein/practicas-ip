from queue import LifoQueue as Pila

# requiere { p tiene elementos }
def buscar_el_maximo(p: Pila) -> int:
    if p.empty():
        raise ValueError("buscar_el_maximo requiere una pila con al menos un valor")
    res = p.get()
    valores: Pila = Pila()
    valores.put(res)
    
    while not p.empty():
        valor_actual = p.get()
        valores.put(valor_actual)
        res = max(res, valor_actual)

    while not valores.empty():
        p.put(valores.get())

    return res
