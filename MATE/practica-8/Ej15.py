from queue import Queue as Cola

# requiere { p tiene elementos }
def buscar_el_maximo(c: Cola) -> int:
    if c.empty():
        raise ValueError("buscar_el_maximo requiere una cola con al menos un valor")
    res = c.get()
    valores: Cola = Cola()
    valores.put(res)
    
    while not c.empty():
        valor_actual = c.get()
        valores.put(valor_actual)
        res = max(res, valor_actual)

    while not valores.empty():
        c.put(valores.get())

    return res

