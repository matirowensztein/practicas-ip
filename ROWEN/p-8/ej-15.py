from queue import Queue as Cola

c = Cola()

def buscar_el_maximo(c: Cola) -> int:
    maximo:int = 0
    valor:int = 0
    
    while not c.empty():
        valor = c.get()
        if maximo < valor:
            maximo = valor
        
    return maximo

print(buscar_el_maximo(c))