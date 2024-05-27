def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, "r")
    res = 0
    while archivo.readline() != "":
        res += 1
    return res

assert contar_lineas("./data/test.txt") == 3

def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, "r")
    contenido = archivo.read()
    archivo.close()
    palabra_actual = ""
    res = False

    for c in contenido:
        if c == " " or c == "\n":
            palabra_actual = ""
        else:
            palabra_actual += c
        
        if palabra_actual == palabra:
            res = True
    
    return res

assert existe_palabra("Primera", "./data/test.txt")
assert existe_palabra("linea", "./data/test.txt")
assert existe_palabra("Segunda", "./data/test.txt")
assert not existe_palabra("Cuarta", "./data/test.txt")

def cantidad_apariciones(palabra: str, nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, "r")
    contenido = archivo.read()
    archivo.close()
    palabra_actual = ""
    res = 0

    for c in contenido:
        if c == " " or c == "\n":
            palabra_actual = ""
        else:
            palabra_actual += c
        
        if palabra_actual == palabra:
            res += 1
    
    return res

assert cantidad_apariciones("Primera", "./data/test.txt") == 1
assert cantidad_apariciones("linea", "./data/test.txt") == 3
assert cantidad_apariciones("Segunda", "./data/test.txt") == 1
assert cantidad_apariciones("Cuarta", "./data/test.txt") == 0
