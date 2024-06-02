def leer_bin(nombre: str) -> list[str]:
    archivo = open(nombre, "br")
    contenido = archivo.read()
    archivo.close()
    res: list[str] = []
    palabra: str = ""

    for c in contenido:
        es_minuscula: bool = c >= ord('a') and c <= ord('z')
        es_mayuscula: bool = c >= ord('A') and c <= ord('Z')
        es_espacio: bool = c == " "
        es_guion: bool = c == "_"
        if es_minuscula or es_mayuscula or es_espacio or es_guion:
            palabra += chr(c)
        elif len(palabra) >= 5 and len(palabra) < 10: # agrego el < 10 para visualizar mejor el archivo en este caso
            res.append(palabra)
        
    return res