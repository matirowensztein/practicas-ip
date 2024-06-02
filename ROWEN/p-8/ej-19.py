def agrupar_por_longitud(nombre_archivo: str) -> dict:
    diccionario = {}
    cant_caracteres: int = 0
        
    arch = open(nombre_archivo, "r")
    texto = arch.read()
    
    for char in texto:
        if char == " " or char == "\n" or char == "\0":
            if cant_caracteres in diccionario.keys():
                cant_palabras = diccionario[cant_caracteres]
                cant_palabras += 1
                diccionario[cant_caracteres] = cant_palabras
                cant_caracteres = 0
            else:
                diccionario[cant_caracteres] = 1
                cant_caracteres = 0
        
        if char != " " and char != "\n":
            cant_caracteres += 1

    arch.close()
    
    return diccionario

print(agrupar_por_longitud("p-8\\textos.txt"))