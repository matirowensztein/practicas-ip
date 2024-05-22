def pertenece_1(lista:list, numero:int) -> bool:
    for i in lista:
        if numero == i:
            return True
        
    return False
        
def pertenece_2(lista:list, numero:int) -> bool:
    pertenece: bool = False
    for i in lista:
        if numero == i:
            pertenece = True
        
            
    return pertenece

def pertenece_3(lista:list, numero:int) -> bool:
    x: int = 0

    while (x < len(lista)):
        if numero == lista[x]:
            return True
        x += 1
        
    return False

