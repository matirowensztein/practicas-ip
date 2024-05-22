def pertenece(p:str, c:str) -> bool:
    for i in p:
        if i == c:
            return True
    return False

def eliminar_repetidos(palabra: str) -> str:
    palabra_sin_repetidos: str = ""

    for i in palabra:
        if pertenece(palabra_sin_repetidos, i):
            palabra_sin_repetidos += ""
        else:
            palabra_sin_repetidos += i
            
    return palabra_sin_repetidos

print(eliminar_repetidos("holasa"))