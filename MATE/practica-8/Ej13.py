from queue import Queue as Cola
import random

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Cola:
    res = Cola()
    
    for _ in range(cantidad):
        res.put(random.randint(desde, hasta))

    return res
