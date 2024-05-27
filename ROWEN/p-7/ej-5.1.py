def pertenece_lista(lista:list, num:int) -> bool:
    pertenece: bool = False
    
    for i in lista:
        if num == i:
            pertenece = True
        
    return pertenece

def pertenece_a_cada_uno_version_1(lista_nums: list[list[int]], num: int) -> list[bool]:
    lista_bools: list = []
    
    for lista in lista_nums:
         lista_bools.append(pertenece_lista(lista,num))
         
    return lista_bools

print(pertenece_a_cada_uno_version_1([[1,2,3],[1,2],[4,5]], 5))