def cambiar_pares(numeros:list):
    x: int = 0

    while (x < len(numeros)):
        if x % 2 == 0 :
            numeros[x] = 0
            x += 1
        else:
            x += 1
        
    return numeros

print(cambiar_pares([1,2,3,4,5,6,7]))
