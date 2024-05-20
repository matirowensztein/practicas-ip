def peso_pino(h:int) -> int:
    if h <= 300:
        return h * 3
    else: 
        return 900 + (h - 300) * 2

def es_peso_util (p:int) -> bool:
    return p >= 400 and p <= 1000

def sirve_pino(h:int) -> bool:
    return es_peso_util(peso_pino(h))

print(sirve_pino(200))
