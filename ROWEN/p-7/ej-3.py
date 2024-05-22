def notas_mayores_cuatro (notas:list) -> bool:
    for i in notas:
        if i < 4:
            return False
    
    return True
            

def promedio(notas:list) -> float:
    sum: int = 0
    
    for i in notas:
        sum += i
    
    return (sum / len(notas))
        
def aprobado(notas:list) -> int:
    if notas_mayores_cuatro(notas) and promedio(notas) >= 7:
        return 1
    elif notas_mayores_cuatro(notas) and (promedio(notas) >= 4 and promedio(notas) <= 7):
        return 2
    else:
        return 3

print(aprobado([9,9,8,7,5]))


