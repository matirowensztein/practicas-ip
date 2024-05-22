def suma_total(lista:list) -> int:
    suma: int = 0
    i: int = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma