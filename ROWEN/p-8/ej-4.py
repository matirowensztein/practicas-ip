def archivo_reverso(nombre_archivo:str, frase:str):
    arch = open(nombre_archivo, "a")
    arch.write("\n" + frase)
    arch.close()

archivo_reverso("p-8\\reverso.txt","Contenido a escribir")