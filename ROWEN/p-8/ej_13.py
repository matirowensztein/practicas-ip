from queue import Queue as Cola
import random

def generar_nros_al_azar(cantidad: int,desde: int,hasta : int) -> Cola[int]:
    c = Cola()
    
    while cantidad > 0:
        c.put(random.randint(desde,hasta))
        cantidad -= 1
    
    return c
