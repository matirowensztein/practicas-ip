# -- (9)

from queue import LifoQueue as Pila

p = Pila()

def cantidad_elementos(p: Pila) -> int:
    p_temp = Pila()
    cant: int = 0
     
    while not p.empty():
        valor = p.get()
        p_temp.put(valor)
        cant += 1
        
    while not p_temp.empty():
        valor = p_temp.get()
        p.put(valor)
        
    return cant

p.put(1)
p.put(2)
p.put(3)
print(p.queue)
print(cantidad_elementos(p))
print(p.queue)