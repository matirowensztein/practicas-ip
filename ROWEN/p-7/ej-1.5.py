def longitud_mayor_7(palabra:str) -> bool:
    x: int = 0
    mayor_7: bool = False

    for i in palabra:
        x+=1
    
    if x > 7 :
        mayor_7 = True
    
    return mayor_7