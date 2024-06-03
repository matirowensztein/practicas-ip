def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
    diccionario = {}
    palabra:str = "" 
    v_repetido:int = 0
    c_repetido:str = ""
        
    arch = open(nombre_archivo, "r")
    texto = arch.read()
    
    for char in texto:
        if char == " " or char == "\n" or char == "\0":
            if palabra in diccionario.keys():
                cant_palabras = diccionario[palabra]
                cant_palabras += 1
                diccionario[palabra] = cant_palabras
                palabra = ""
            else:
                diccionario[palabra] = 1
                palabra = ""
        
        if char != " " and char != "\n":
            palabra += char
            
    for c,v in diccionario.items():
        if v > v_repetido:
            v_repetido = v
            c_repetido = c
           
    arch.close()
    
    return c_repetido

print(la_palabra_mas_frecuente("p-8\\textos.txt"))