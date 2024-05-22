def ordenados(lista:list) -> bool:
    x: int = 0
    ordenado: bool = True
    while (x < len(lista) - 1):
        if lista[x] >= lista[x + 1]:
            return False
        x += 1
        
    return ordenado