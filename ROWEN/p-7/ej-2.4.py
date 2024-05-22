def reemplaza_vocales(palabra:str) -> str:
    palabra_nueva: str = ""

    for i in palabra:
        if i not in "aeiou":
            palabra_nueva += i
        else:
            palabra_nueva += "_"
        
    return palabra_nueva

print(reemplaza_vocales("holasas"))