def tres_vocales_distintas(palabra:str) -> bool:
    vocales: str = ""
    cant_vocales: int = 0
    palabra_valida: bool = False
    
    for i in palabra:
        if i in vocales:
            vocales += i
        
        if i == "a" or i == "e" or i == "i" or i == "o" or i == "u":
            vocales += i
            cant_vocales += 1
            
    if cant_vocales >= 3:
        palabra_valida = True
        
    return palabra_valida


print(tres_vocales_distintas("holua"))
    
    