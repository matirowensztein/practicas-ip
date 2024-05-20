def alguno_es_0(n:int, m:int) -> bool:
    return n == 0 or m == 0

def ambos_son_0(n:int, m:int) -> bool:
    return n == 0 and m == 0

def es_nombre_largo(nombre:str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8

def es_bisiesto(año:int) -> bool:
    return año % 4 == 0 and año % 100 != 0

print(es_bisiesto(800))