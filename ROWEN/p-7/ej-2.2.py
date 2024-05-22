def cambiar_pares(numeros:list):
    x: int = 0
    lista_sin_pares: list = []

    while (x < len(numeros)):
        if x % 2 == 0 :
            lista_sin_pares.append(0)
            x += 1
        else:
            lista_sin_pares.append(numeros[x])
            x += 1
        
    return lista_sin_pares

print(cambiar_pares([1,2,3,4,5,6,7]))