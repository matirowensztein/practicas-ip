from queue import LifoQueue as Pila

p = Pila()

def cantidad_elementos(p: Pila) -> int:
    cantidad = 0
    while p.empty() != True:
        p.get()
        cantidad += 1
        
    return cantidad

print(cantidad_elementos(p))
