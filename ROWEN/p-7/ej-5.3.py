def es_matriz(matrices: list[list[int]]) -> bool:
    matriz_valida: bool = True
    
    if len(matrices) == 0 or len(matrices[0]) == 0:
        matriz_valida = False 
    
    for matriz in matrices:
        if len(matriz) != len(matrices[0]):
            matriz_valida = False
    
    return matriz_valida
            

print(es_matriz([[],[]]))