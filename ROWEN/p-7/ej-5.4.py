def ordenados(lista:list) -> bool:
    x: int = 0
    ordenado: bool = True
    while (x < len(lista) - 1):
        if lista[x] >= lista[x + 1]:
            return False
        x += 1
        
    return ordenado
        

def filas_ordenadas(matrices: list[list[int]]) -> list[bool]:
    lista_bools: list = []

    for matriz in matrices:
        lista_bools.append(ordenados(matriz))
    
    return lista_bools
            