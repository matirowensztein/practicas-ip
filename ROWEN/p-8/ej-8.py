from queue import LifoQueue as Pila
import random

def generar_nros_al_azar(cantidad: int,desde: int,hasta : int) -> Pila[int]:
    p = Pila()
    
    while cantidad > 0:
        p.put(random.randint(desde,hasta))
        cantidad -= 1
    
    return p
    
print(generar_nros_al_azar(2,1,123).queue)
