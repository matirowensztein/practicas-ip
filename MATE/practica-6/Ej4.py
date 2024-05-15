def peso_pino(h: int) -> int:
    if (h <= 300):
        return h * 3
    else:
        return 900 + (h - 300) * 2

def es_peso_util(p: int) -> bool:
    return p >= 400 and p <= 1000

# def sirve_pino(h: int) -> bool:
#     peso = None
#     if (h <= 300):
#         peso = h * 3
#     else:
#         peso = 900 + (h - 300) * 2
    
#     return peso >= 400 and peso <= 1000

def sirve_pino(h: int) -> bool:
    return es_peso_util(peso_pino(h))

assert peso_pino(100) == 300
assert peso_pino(200) == 600
assert peso_pino(500) == 1300

assert not es_peso_util(100)
assert es_peso_util(600)
assert not es_peso_util(1100)

assert not sirve_pino(100)
assert sirve_pino(200)
assert not sirve_pino(500)

print("Todos los test pasaron!")
