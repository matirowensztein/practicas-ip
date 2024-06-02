from queue import LifoQueue as Pila

p = Pila()

def buscar_el_maximo(p: Pila) -> int:
    maximo:int = 0
    valor:int = 0
    
    while not p.empty():
        valor = p.get()
        if maximo < valor:
            maximo = valor
        
    return maximo

p.put(1)
p.put(4)
p.put(43)
p.put(6)
print(buscar_el_maximo(p))
