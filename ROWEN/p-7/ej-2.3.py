def borrar_vocales(palabra:str) -> str:
    x: int = 0
    palabra_nueva: str = ""

    for i in palabra:
        if i not in "aeiou":
            palabra_nueva += i
        
    return palabra_nueva

print(borrar_vocales("holasas"))