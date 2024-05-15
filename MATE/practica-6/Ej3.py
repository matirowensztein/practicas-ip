def alguno_es_0(n1: int, n2: int) -> bool:
    return n1 == 0 or n2 == 0

def ambos_son_0(n1: int, n2: int) -> bool:
    return n1 == 0 and n2 == 0

def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) >= 3 and len(nombre) <= 8

def es_bisiesto(n: int) -> bool:
    return n % 400 == 0 or (n % 4 == 0 and n % 100 != 0)
