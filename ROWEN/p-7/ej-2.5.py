def da_vuelta_str(palabra:str) -> str:
    palabra_reverso: str = ""

    for i in palabra[::-1]:
        palabra_reverso += i
        
    return palabra_reverso

print(da_vuelta_str("hola"))