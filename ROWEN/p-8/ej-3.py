def archivo_reverso(nombre_archivo: str):
    cont: int = 1
    texto_reverso:str = ""
        
    arch = open(nombre_archivo, "r")
    lineas = arch.readlines()
      
    while (cont <= len(lineas)):
         texto_reverso += lineas[len(lineas) - cont]
         cont += 1
    
    return texto_reverso
        
    
print(archivo_reverso("p-8\\reverso.txt"))