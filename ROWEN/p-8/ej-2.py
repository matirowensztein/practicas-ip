def clonarSinComentarios(nombre_archivo: str):
    sin_comentarios:str = ""
    cond_valida:bool = True
        
    arch = open(nombre_archivo, "r")
    lineas = arch.readlines()    

    for linea in lineas:
        for char in linea:
            if char == "#":
                cond_valida = False
                
            if cond_valida and char != " ":
                sin_comentarios += linea
                cond_valida = False
                      
        cond_valida = True
        
    arch.close()
    
    return sin_comentarios

print(clonarSinComentarios("p-8\\textos.txt"))